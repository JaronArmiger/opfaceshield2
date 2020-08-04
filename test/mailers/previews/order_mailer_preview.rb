# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/confirmation
  def confirmation
  	@user = User.find_by_email("hombre@masculinida")
  	@order = Order.find(4)
    OrderMailer.confirmation(@user, @order)
  end

  def cancellation
  	@user = User.find_by_email("hombre@masculinida")
  	@order = Order.find(4)
    OrderMailer.cancellation(@user, @order)
  end

end
