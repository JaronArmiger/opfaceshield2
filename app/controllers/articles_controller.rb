class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :is_admin?, except: [:index, :show]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article added!"
      redirect_to articles_path
    else
  	  render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article updated!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "Article deleted!"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:url,:title,:img_src)
    end

    def is_admin?
      unless current_user.admin?
      	redirect_to root_path
      end
    end
end
