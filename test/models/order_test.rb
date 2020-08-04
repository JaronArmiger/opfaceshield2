require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
  	@order = orders(:one)
  end

  test "should be valid" do
  	assert @order.valid?
  end

  test "num_shields should be present" do
  	@order.num_shields = nil
  	assert_not @order.valid?
  end

  test "num_shields <= 999" do
  	@order.num_shields = 1000
  	assert_not @order.valid?
  end

  test "num_adjusters should be present" do
  	@order.num_adjusters = nil
  	assert_not @order.valid?
  end

  test "num_adjusters <= 999" do
  	@order.num_adjusters = 1000
  	assert_not @order.valid?
  end
  
  test "message should be present" do
    @order.message = nil
    assert_not @order.valid?
  end

  test "message should be <= 140 char" do
    @order.message = "q" * 141
    assert_not @order.valid?
  end

  test "street address must be present" do
    @order.street_address = nil
    assert_not @order.valid?
  end

  test "street address must be less than 101 chars" do
    @order.street_address = "a" * 101
    assert_not @order.valid?
  end

  test "city must be present" do
    @order.city = nil
    assert_not @order.valid?
  end  
  
  test "state must be present" do
    @order.state = nil
    assert_not @order.valid?
  end

  test "zipcode must be 5 digits" do
    @order.zipcode = 2050
    assert_not @order.valid?
  end

  test "zipcode should only contain numbers" do
    @order.zipcode = "A" * 5
    assert_not @order.valid?
  end

  test "zipcode should convert string digits to integer" do
    @order.zipcode = "1" * 5
    assert @order.valid?
  end
end
