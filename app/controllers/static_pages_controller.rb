class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]
  def home
  	@posts = Post.order('created_at DESC')
  end

  def about
  end

  def paypal_cancel
    
  end

  def paypal_completed
  end
end
