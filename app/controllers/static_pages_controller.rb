class StaticPagesController < ApplicationController
  include StaticPagesHelper
  
  skip_before_action :authenticate_user!, only: [:home, :about]
  def home

  end

  def about
  end

  def paypal_cancel
    flash[:success] = "Your donation has been canceled."
    cookie_redirect
  end

  def paypal_completed
    flash[:success] = "Thank you for your donation!"
    cookie_redirect
  end
end
