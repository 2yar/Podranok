class CartsController < ApplicationController
  before_action :params_cart, only: [:show, :destroy]
  skip_before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  
  def create
    if @cart.save
      redirect_to @cart
    else
      redirect_to products_path
    end
  end

  def show; end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Now your shopping cart is empty!' }
    end
  end

  private

  def params_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to products_path, notice: 'Invalid cart'
  end
end
