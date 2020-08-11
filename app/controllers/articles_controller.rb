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
    @article = Article.new(article_params)
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
    def article_params
      params.require(:article).permit(:url,:title,:img_src)
    end

    def is_admin?
      unless current_user.admin?
      	redirect_to root_path
      end
    end
end
