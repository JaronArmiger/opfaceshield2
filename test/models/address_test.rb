require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
  	@address = addresses(:one)
  end

  test "should be valid" do
  	assert @address.valid?
  end

  test "street address must be present" do
    @address.street_address = nil
    assert_not @address.valid?
  end

  test "street address must be less than 101 chars" do
    @address.street_address = "a" * 101
    assert_not @address.valid?
  end

  test "city must be present" do
    @address.city = nil
    assert_not @address.valid?
  end  
  
  test "state must be present" do
    @address.state = nil
    assert_not @address.valid?
  end

  test "zipcode must be 5 digits" do
  	@address.zipcode = 2050
  	assert_not @address.valid?
  end

  test "zipcode should only contain numbers" do
  	@address.zipcode = "A" * 5
  	assert_not @address.valid?
  end

  test "zipcode should convert string digits to integer" do
  	@address.zipcode = "1" * 5
  	assert @address.valid?
  end
end
