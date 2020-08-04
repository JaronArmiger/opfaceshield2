require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
	def setup
	  @regular_user = users(:alfonso)
	  #@regular_user.confirm
	  @admin = users(:admin)
	  #@admin.confirm
	end

	test "no routes available with no user signed in" do
	  order = orders(:one)
	  # index
	  get admin_orders_path
	  assert_redirected_to new_user_session_path
	  # show
	  get admin_order_path(order)
	  assert_redirected_to new_user_session_path
	  # processed
	  get processed_admin_orders_path
	  assert_redirected_to new_user_session_path
	  # unprocessed
	  get unprocessed_admin_orders_path
	  assert_redirected_to new_user_session_path
	  # update
	  patch admin_order_path(order)
	  assert_redirected_to new_user_session_path
	  # destroy
	  delete admin_order_path(order)
	  assert_redirected_to new_user_session_path
	end

	test "non-admin should be redirected" do
	  sign_in @regular_user
	  get orders_path
	  assert_response :success
	  order = orders(:one)
	  # index
	  get admin_orders_path
	  assert_redirected_to root_path
	  assert_not flash.empty?
	  # show
	  get admin_order_path(order)
	  assert_redirected_to root_path
	  assert_not flash.empty?
	  # processed
	  get processed_admin_orders_path
	  assert_redirected_to root_path
	  assert_not flash.empty?
	  # unprocessed
	  get unprocessed_admin_orders_path
	  assert_redirected_to root_path
	  assert_not flash.empty?
	  # update
	  patch admin_order_path(order)
	  assert_redirected_to root_path
	  assert_not flash.empty?
	  # destroy
	  delete admin_order_path(order)
	  assert_redirected_to root_path
	  assert_not flash.empty?
	end

	test "admin should be able to access admin routes" do
	  sign_in @admin
	  order = orders(:one)
	  # index
	  get admin_orders_path
	  assert_response :success
	  # show
	  get admin_order_path(order)
	  assert_response :success
	  # processed
	  get processed_admin_orders_path
	  assert_response :success
	  # unprocessed
	  get unprocessed_admin_orders_path
	  assert_response :success
	end

	test "should process unprocessed order" do
	  sign_in @admin
	  order = orders(:two)
	  assert_not order.processed?
	  patch admin_order_path(order, process: true)
	  assert order.reload.processed?
	end

	test "trying to process processed order should cause no change" do
	  sign_in @admin
	  order = orders(:one)
	  assert order.processed?
	  patch admin_order_path(order, process: true)
	  assert order.reload.processed?
	end

	test "should unprocess processed order" do
	  sign_in @admin
	  order = orders(:one)
	  assert order.processed?
	  patch admin_order_path(order, process: false)
	  assert_not order.reload.processed?
	end

	test "trying to unprocess unprocessed order should cause no change" do
	  sign_in @admin
	  order = orders(:two)
	  assert_not order.processed?
	  patch admin_order_path(order, process: false)
	  assert_not order.reload.processed?
	end

	test "should not destroy unprocessed order" do
	  sign_in @admin
	  order = orders(:two)
	  assert_not order.processed?
	  assert_no_difference 'Order.count' do
	    delete admin_order_path(order)
	  end
	  assert_redirected_to admin_orders_path
	end

	test "should destroy processed order" do
	  sign_in @admin
	  order = orders(:one)
	  assert order.processed?
	  assert_difference 'Order.count', -1 do
	    delete admin_order_path(order)
	  end
	  assert_redirected_to admin_orders_path
	  assert_not flash.empty?
	end
end