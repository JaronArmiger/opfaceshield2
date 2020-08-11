require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@first_user = users(:alfonso)
  	@first_user.confirm
  	@second_user = users(:ozuna)
  	@second_user.confirm
  	@admin = users(:admin)
  	@admin.confirm
  end

  test "no routes should be accessible without sign in" do
  	account = accounts(:one)
  	get account_path(account)
  	assert_redirected_to new_user_session_path
  	get edit_account_path(account)
  	assert_redirected_to new_user_session_path
  	get new_account_path
  	assert_redirected_to new_user_session_path
  	post accounts_path
  	assert_redirected_to new_user_session_path
  	patch account_path(account)
  	assert_redirected_to new_user_session_path
  end

  test "should redirect from new path if user already has account" do
  	sign_in @first_user
  	get new_account_path
  	assert_redirected_to root_path
  end

  test "should be able to view own account when signed in" do
  	sign_in @first_user
  	account = @first_user.account
  	get account_path(account)
  	assert_response :success
  end

  test "should not be able to view other users accounts" do
  	sign_in @first_user
  	account = @second_user.account
  	get account_path(account)
  	assert_redirected_to root_path
  end
end
