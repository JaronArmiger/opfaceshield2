class AdminMailer < ApplicationMailer
  include ApplicationHelper
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.cancellation.subject
  #
  def cancellation(user,order)
  	@user = user
  	@account = user.account
  	@order = order

    mail to: administrator.email, subject: "Cancellation of Order ##{@order.id} for #{@account.institution_name}"
  end
end
