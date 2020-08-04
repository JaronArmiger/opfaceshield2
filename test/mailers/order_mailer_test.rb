require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
=begin
  def setup
  	@user = users(:alfonso)
  	@account = @user.account
  	@order = @account.orders.first
  end

  test "confirmation" do
    mail = OrderMailer.confirmation(@user, @order)
    assert_equal "PPE Order for #{@account.institution_name}", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match @account.contact_first_name, mail.body.encoded
    assert_match @account.institution_name, mail.body.encoded
  end

  test "cancellation" do
    assert_not @order.processed?
    mail = OrderMailer.cancellation(@user, @order)
    assert_equal "Cancellation of Order ##{@order.id} for #{@account.institution_name}", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match @account.contact_first_name, mail.body.encoded
    assert_match @account.institution_name, mail.body.encoded
    assert_match "canceled", mail.body.encoded
  end
=end
end
