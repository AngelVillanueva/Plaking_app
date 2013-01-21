class UserMailer < ActionMailer::Base
  default from: "Matricula El Coche <info@matriculaelcoche.com>"

  def welcome_email(order)
    @order = order
    @user = order.user
    @url  = order_url(order.id, locale: I18n.locale)
    mail(:to => order.user.email, :subject => t("email.welcome.subject"))
  end
  def admin_new_order_email(order)
    @order = order
    admins = User.where(admin: true)
    admins.each do |admin|
      mail(:to => admin.email, :subject => t("email.admin_new_order.subject"))
    end
  end
  def status_changed_email(order)
    @order = order
    @user = order.user
    @url = order_url(order.id, locale: I18n.locale)
    if order.clip_file_name
      attachments['docs.pdf'] = File.read("#{order.clip.path}")
    end
    mail(:to => order.user.email, :subject => t("email.status_changed.subject", id: order.id))
  end
  def admin_status_changed_email(order)
    @order = order
    @url = orders_url(locale: I18n.locale)
    admins = User.where(admin: true)
    admins.each do |admin|
      mail(to: admin.email, subject: t("email.admin_status_changed.subject", id: order.id))
    end
  end
end
