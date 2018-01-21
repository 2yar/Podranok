class OrderNotifierMailer < ApplicationMailer
  default from: 'Интернет магазин Podranok <podranok@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Подтверждение заказа в Podranok Store'  
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #
  def shipped
    @greeting = "Hi"
    mail to: "podranok@gmail.com>"
  end
end
