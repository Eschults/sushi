class PagesController < ApplicationController
  layout "home", only: [:home, :faq, :cgu, :service]
  skip_before_action :authenticate_user!

  def home
  end

  def about
  end

  def tarifs
  end

  def faq
  end

  def cgu
  end

  def service
  end

  def sitemap
  end

end
