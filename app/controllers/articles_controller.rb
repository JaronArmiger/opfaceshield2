class ArticlesController < ApplicationController
  before_action :is_admin?, except: [:index, :show]

  def index
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
    url = params[:article][:url]
    img_src = params[:article][:img_src]
    html = RestClient.get(url)
    parsed_data = Nokogiri::HTML.parse(html)
    title = parsed_data.title
    @article = Article.new(url: url, title: title, img_src: img_src)
    if @article.save
      flash[:success] = "Article added!"
      redirect_to article_path(@article)
    else
  	  render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def is_admin?
      unless current_user.admin?
      	redirect_to root_path
      end
    end
end
