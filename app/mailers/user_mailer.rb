class UserMailer < ActionMailer::Base
  default from: '"HipCleaner" <contact@hipcleaner.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    mail(to: @user.email,
         bcc: "antoinegarcia@hipcleaner.com, florianboret@hipcleaner.com",
         subject: "Bienvenue chez HipCleaner !")
  end
end
