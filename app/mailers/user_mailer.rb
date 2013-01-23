class UserMailer < ActionMailer::Base
  default from: "Matricula El Coche <info@matriculaelcoche.com>"

  def welcome_email(order)
    # delayed_job requires this trick to use the right locale, at the end the locale is re-set
    old_locale = I18n.locale
    I18n.locale = locale
    # view variables
    @teaser = t("email.welcome.subject")
    @order = order
    @user = order.user
    @url  = order_url(order.id, locale: I18n.locale)
    mail(:to => order.user.email, :subject => t("email.welcome.subject"))
    # re-set locale (delayed_job trick, see above)
    I18n.locale = locale
  end

  def admin_new_order_email(order)
    # delayed_job requires this trick to use the right locale, at the end the locale is re-set
    old_locale = I18n.locale
    I18n.locale = locale
    # view variables
    @teaser = t("email.welcome.subject")
    @order = order
    admins = User.where(admin: true)
    admins.each do |admin|
      mail(:to => admin.email, :subject => t("email.admin_new_order.subject"))
    end
    # re-set locale (delayed_job trick, see above)
    I18n.locale = locale
  end

  def status_changed_email(order)
    # delayed_job requires this trick to use the right locale, at the end the locale is re-set
    old_locale = I18n.locale
    I18n.locale = locale
    # view variables
    @teaser = t("email.status_changed.subject", id: order.id)
    @order = order
    @user = order.user
    @url = order_url(order.id, locale: I18n.locale)
    if order.clip_file_name
      attachments['docs.pdf'] = File.read("#{order.clip.path}")
    end
    mail(:to => order.user.email, :subject => t("email.status_changed.subject", id: order.id))
    # re-set locale (delayed_job trick, see above)
    I18n.locale = locale
  end

  def admin_status_changed_email(order)
    # delayed_job requires this trick to use the right locale, at the end the locale is re-set
    old_locale = I18n.locale
    I18n.locale = locale
    # view variables
    @teaser = t("email.admin_status_changed.subject", id: order.id)
    @order = order
    @url = orders_url(locale: I18n.locale)
    admins = User.where(admin: true)
    admins.each do |admin|
      mail(to: admin.email, subject: t("email.admin_status_changed.subject", id: order.id))
    end
    # re-set locale (delayed_job trick, see above)
    I18n.locale = locale
  end
  
  def shop_email(order, locale)
    # delayed_job requires this trick to use the right locale, at the end the locale is re-set
    old_locale = I18n.locale
    I18n.locale = locale
    # view variables
    @order = order
    if @order.owner = "Business"
      @owner = order.registered_name
    else
      @owner = order.first_name << ' ' << order.last_name
    end
    @teaser = t("A new temporary documentation from Matricula El Coche")
    # send email just if PDF exists (double check)
    if order.clip_file_name
      attachments['docs.pdf'] = File.read("#{order.clip.path}")
      mail(to: order.shop_email, subject: t("Shop email subject"))
    end
    # re-set locale (delayed_job trick, see above)
    I18n.locale = locale
  end
end
