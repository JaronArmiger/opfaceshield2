# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  
  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/cancellation
  def cancellation
    user = User.find_by_email("hombre@masculinida")
    order = Order.first
    AdminMailer.cancellation(user,order)
  end

end
