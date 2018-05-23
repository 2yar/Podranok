class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_url, notice: 'Статья успешно создана.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @articles, notice: 'Статья успешно обновлена.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Статья успешно удалена.' }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :description, :image)
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
