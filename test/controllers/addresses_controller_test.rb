require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@first_user = users(:alfonso)
  	@first_user.confirm
  	@second_user = users(:ozuna)
  	@second_user.confirm
  end

  test "should redirect all routes if no user signed in" do
  	address = addresses(:one)
  	get new_address_path
  	assert_redirected_to new_user_session_path
  	get edit_address_path(address)
  	assert_redirected_to new_user_session_path
  	post addresses_path
  	assert_redirected_to new_user_session_path
  	patch address_path(address)
  	assert_redirected_to new_user_session_path
    delete address_path(address)
    assert_redirected_to new_user_session_path
  end

  test "edit and update work on user's own addresses when signed in" do
  	sign_in @first_user
  	my_address = @first_user.account.addresses.first
  	get edit_address_path(my_address)
  	assert_response :success
  	street_address = "12 W Yesterday St"
  	city = "Morenton"
  	state = "Glint"
  	zipcode = 32333
  	patch address_path(my_address), params: { 
  									address: { street_address: street_address,
  											   city: city,
  											   state: state,
  											   zipcode: zipcode} }
  	assert_equal my_address.reload.street_address, street_address
  	assert_equal my_address.reload.city, city
  	assert_equal my_address.reload.state, state
  	assert_equal my_address.reload.zipcode, zipcode
  end

  test "should redirect edit and update on other user's address" do
  	sign_in @first_user
  	other_address = @second_user.account.addresses.first
  	get edit_address_path(other_address)
  	assert_redirected_to root_path
  	street_address = "12 W Yesterday St"
  	city = "Morenton"
  	state = "Glint"
  	zipcode = 32333
  	patch address_path(other_address), params: { 
  									address: { street_address: street_address,
  											   city: city,
  											   state: state,
  											   zipcode: zipcode} }
    assert_redirected_to root_path
    assert_not_equal other_address.reload.street_address, street_address
  	assert_not_equal other_address.reload.city, city
  	assert_not_equal other_address.reload.state, state
  	assert_not_equal other_address.reload.zipcode, zipcode
  end

  test "should successfully delete signed in user's address" do
    sign_in @first_user
    my_address = @first_user.account.addresses.first
    assert_difference 'Address.count', -1 do
      delete address_path(my_address)
    end
  end

  test "should redirect delete on another user's address" do
    sign_in @first_user
    other_address = @second_user.account.addresses.first
    delete address_path(other_address)
    assert_redirected_to root_path
  end

end
