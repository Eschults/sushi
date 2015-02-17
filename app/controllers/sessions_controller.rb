class SessionsController < Devise::SessionsController
  layout 'home', only: [:new]

  protected

end