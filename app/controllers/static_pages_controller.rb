class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :news]
  def home
  	@posts = Post.order('created_at DESC')
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

  def news
    @response = open('https://stackoverflow.com/questions/44678437/no-such-file-or-directory-rb-sysopen-ruby');

  end
end
