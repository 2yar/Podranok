class CartsController < ApplicationController
  before_action :params_cart, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  def create
    if @cart.save
      redirect_to @cart
    else
      redirect_to products_path
    end
  end

  def show; end

  private

  def params_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to products_path, notice: 'Invalid cart'
  end
end
