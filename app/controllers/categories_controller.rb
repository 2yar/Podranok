class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @products = Product.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 4)
  end

  def new
    @category = Category.new
    @parent_categories = Category.order(:name, :id)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Категория успешно создана'
    else
      format.html { render :new }
    end
  end

  def edit
    @parent_categories = Category.order(:name, :id)
  end

  def update
    if 
      @category.update_attributes(category_params)
      redirect_to categories_path, success: 'Категория успешно обновлена'
    else
      format.html { render :edit }
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Категория успешно удалена'
  end

  private

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id, :image)
  end
end
