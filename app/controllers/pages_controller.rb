class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "home", only: :home

  def home
  end

  def about
  end

  def tarifs
  end
end
