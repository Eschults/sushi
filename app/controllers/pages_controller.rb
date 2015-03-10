class PagesController < ApplicationController
  layout "home", only: [:home, :faq, :cgu, :service]

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
