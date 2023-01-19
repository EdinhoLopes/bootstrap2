class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:edit, :update, :destroy]

  def index
    current_page = (params[:page] || 1).to_i
    @articles = Article.order(created_at: :desc).page(current_page).per(2)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(artcile_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(artcile_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def artcile_params
    params.require(:article).permit(:title, :body)
  end
end
