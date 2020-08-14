class StaticPagesController < ApplicationController
  include StaticPagesHelper
  
  skip_before_action :authenticate_user!, only: [:home, :about, :news]
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

  def news
    html = RestClient.get 'https://www.mlive.com/news/ann-arbor/2020/04/ann-arbor-pilot-flies-face-shields-to-health-care-workers-around-midwest-to-help-fight-coronavirus.html'
    parsed_data = Nokogiri::HTML.parse(html)
    @response = parsed_data.css("img")[0]['src']
  end
end
