require 'test_helper'

class OrderInterfaceTest < ActionDispatch::IntegrationTest
  def setup
  	# first user has no account and no addresses
  	@first_user = users(:natasha)
  	#@first_user.confirm
  	# second user has account but no addresses
  	@second_user = users(:ozuna)
  	#@second_user.confirm
    @second_user.account.addresses.delete_all
  	# third user has account and address
  	@third_user = users(:alfonso)
  	#@third_user.confirm

    ActionMailer::Base.deliveries.clear
  end

  test "should redirect new order path if no account" do
  	sign_in @first_user
  	get new_order_path
  	assert_redirected_to new_account_path
  	assert_not flash.empty?
  end

  test "should redirect new order path if account but no adddress" do
  	sign_in @second_user
  	get new_order_path
  	assert_redirected_to new_address_path
  	assert_not flash.empty?
  end

  test "creating order" do
  	sign_in @third_user
  	get new_order_path
  	assert_response :success
  	# user's associated addresses should be listed
  	address = @third_user.account.addresses.first
  	assert_match address.street_address, response.body
  	# submit form by selecting pre-existing address
  	assert_difference 'Order.count', 1 do
  	  post orders_path, params: { order: { 
  	  						num_shields: '100',
  	  						num_adjusters: '200',
  	  						message: "estoy buscando la cura",
  	  						address_id: address.id
  	  					 } }
  	end
    #assert_equal 1, ActionMailer::Base.deliveries.size
  	#submit form by filling in address fields
  	assert_difference 'Order.count', 1 do
  	  post orders_path, params: { order: { 
  	  						num_shields: '100',
  	  						num_adjusters: '200',
  	  						message: "estoy buscando la cura",
  	  						street_address: "25 Westwood Dr",
  	  						city: "Chickham",
  	  						state: "Bernton",
  	  						zipcode: '98777'
  	  					 } }
  	end
    #assert_equal 2, ActionMailer::Base.deliveries.size
  	@order = assigns(:order)
  	assert_redirected_to order_path(@order)
  	follow_redirect!
  	assert_not flash.empty?
  	assert_match @order.street_address, response.body
  end
end
