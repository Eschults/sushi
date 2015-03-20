class PasswordsController < Devise::PasswordsController
  protected

  def after_resetting_password_path_for(resource_name)
    new_order_path
  end
end