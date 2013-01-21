class UserMailer < ActionMailer::Base
  default from: "info@matriculaelcoche.com"

  def welcome_email(order)
    @user = order.user
    @order = order
    @url  = "http://example.com/login"
    mail(:to => order.user.email, :subject => t("email.welcome.subject"))
  end
  def admin_new_order_email(order)
    @order = order
    admins = User.where(admin: true)
    admins.each do |admin|
      mail(:to => admin.email, :subject => t("email.admin_new_order.subject"))
    end
  end
end
