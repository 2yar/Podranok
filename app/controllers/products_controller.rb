class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.paginate(page: params[:page], per_page: 6)
    if params[:search]
      @products = Product.search(params[:search]).order(:name, :price).paginate(page: params[:page], per_page: 4)
    end
  end
  
  def show; end
 
  def new
    @product = Product.new
    @сategory = Category.order(:name, :id)
  end

  def edit
    @сategory = Category.order(:name, :id)
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private

  def check_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :weight, :image, :category_id)
  end
end
