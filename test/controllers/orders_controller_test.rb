require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@first_user = users(:alfonso)
  	#@first_user.confirm
  	@second_user = users(:ozuna)
  	#@second_user.confirm
  	@admin = users(:admin)
  	#@admin.confirm
  end

  test "no views should be accessible if no user signed in" do
  	get orders_path
  	assert_redirected_to new_user_session_path
  	get new_order_path
  	assert_redirected_to new_user_session_path
  	order = orders(:one)
  	get order_path(order)
  	assert_redirected_to new_user_session_path
  end

  test "index should only contain user's orders if not admin" do
  	sign_in @first_user
  	get orders_path
  	assert_response :success
  	account = @first_user.account
  	account.orders.each do |order|
  		assert_match order.street_address, response.body
  	end
  	#other user's order should not be rendered
  	other_order = @second_user.account.orders.first
  	assert_select 'span', text: other_order.street_address, count: 0
  end
  
  test "admin should be redirected to admin_orders_path" do
  	assert @admin.admin?
  	sign_in @admin
  	get orders_path
  	assert_redirected_to admin_orders_path
  	#orders.each do |order|
  	  #assert_match order.street_address, response.body
  	#end
  end

  test "should redirect from show if order belongs to other user" do
  	sign_in @second_user
  	my_order = @second_user.account.orders.first
  	get order_path(my_order)
  	assert_response :success
  	other_order = @first_user.account.orders.first
  	get order_path(other_order)
  	assert_redirected_to root_path
  end

  test "should redirect destroy if user not signed in" do
    order = orders(:one)
    assert_no_difference 'Order.count' do
      delete order_path(order)
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy on other user's order" do
    sign_in @first_user
    order = @second_user.account.orders.first
    assert_no_difference 'Order.count' do
      delete order_path(order)
    end
    assert_redirected_to root_path
  end

  test "should redirect destroy if order already processed" do
    sign_in @first_user
    processed_order = @first_user.account.orders.last
    assert processed_order.processed?
    assert_no_difference 'Order.count' do
      delete order_path(processed_order)
    end
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should successfully destroy if user signed in and order not processed" do
    #ActionMailer::Base.deliveries.clear
    sign_in @first_user
    unprocessed_order = @first_user.account.orders.first
    assert_not unprocessed_order.processed?
    assert_difference 'Order.count', -1 do
      delete order_path(unprocessed_order)
    end
    #assert_equal 2, ActionMailer::Base.deliveries.size
    assert_redirected_to root_path
  end
end
