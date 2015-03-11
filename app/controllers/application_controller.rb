class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'action_view'
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if request.env['omniauth.origin']
      new_order_path
    end
  end
end
