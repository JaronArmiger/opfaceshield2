require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:alfonso)
  	#@user.confirm
  	@account = @user.account
  	@user_no_account = users(:natasha)
  	#@user_no_account.confirm
    @admin = users(:admin)
    #@admin.confirm
  end

  test "layout links if not logged in" do
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select 'a[href=?]', root_path
  	assert_select 'a[href=?]', new_user_session_path
  	assert_select 'a[href=?]', new_user_registration_path
  	assert_select 'a[href=?]', new_order_path, count: 0
  	assert_select 'a[href=?]', account_path(@account), count: 0
  end

  test "layout links for signed in regular user without account" do
  	sign_in @user_no_account
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select 'a[href=?]', root_path
  	assert_select 'a[href=?]', new_account_path
  	assert_select 'a[href=?]', new_order_path
  	assert_select 'a[href=?]', destroy_user_session_path
  end

  test "layout links for signed in regular user with account" do
  	sign_in @user
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select 'a[href=?]', root_path
  	assert_select 'a[href=?]', new_account_path, count: 0
  	assert_select 'a[href=?]', account_path(@account)
  	assert_select 'a[href=?]', new_order_path
    assert_select 'a[href=?]', orders_path
    assert_select 'a[href=?]', new_post_path
  	assert_select 'a[href=?]', destroy_user_session_path
  end

  test "layout links for signed in admin" do
    sign_in @admin
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', new_account_path, count: 0
    assert_select 'a[href=?]', account_path(@account), count: 0
    assert_select 'a[href=?]', new_order_path, count: 0
    assert_select 'a[href=?]', destroy_user_session_path
    assert_select 'a[href=?]', admin_orders_path
    assert_select 'a[href=?]', new_post_path
    #assert_select 'a[href=?]', processed_admin_orders_path
    #assert_select 'a[href=?]', unprocessed_admin_orders_path
  end
end
