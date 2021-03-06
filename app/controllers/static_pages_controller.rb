class StaticPagesController < ApplicationController
  include StaticPagesHelper
  
  skip_before_action :authenticate_user!
  def home
    @articles = Article.order(created_at: :desc).limit(3)
  end

  def about
  end

  def contact
  end

  def paypal_cancel
    flash[:success] = "Your donation has been canceled."
    cookie_redirect
  end

  def paypal_completed
    flash[:success] = "Thank you for your donation!"
    cookie_redirect
  end

  def files
  end
end
