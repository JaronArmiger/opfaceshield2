require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
=begin
  def setup
  	@user = users(:alfonso)
  	@account = @user.account
  	@order = @account.orders.first
  	@admin = users(:admin)
  end
  
  test "cancellation" do
  	assert_not @order.processed?
    mail = AdminMailer.cancellation(@user, @order)
    assert_equal "Cancellation of Order ##{@order.id} for #{@account.institution_name}", mail.subject
    assert_equal [@admin.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match @user.email, mail.body.encoded
    assert_match @account.institution_name, mail.body.encoded
  end
=end
end
