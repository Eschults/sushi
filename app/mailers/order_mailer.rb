class OrderMailer < ActionMailer::Base
  default from: "contact@hipcleaner.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.neworder.subject
  #
  def new_order(order)
    @order = order
    mail(to: @order.user.email,
         bcc: "antoinegarcia@hipcleaner.com",
         subject: 'Nouvelle commande confirmée')
  end
end
