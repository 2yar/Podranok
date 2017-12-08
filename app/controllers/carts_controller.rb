class CartsController < ApplicationController
  before_action :params_cart, only: [:show]
  def create
    if @cart.save
      redirect_to @cart
    else
      redirect_to products_path
    end
  end

  def new
    @cart = Cart.new
  end

  def show; end

  def destroy; end

  private

  def params_cart
    @cart = Cart.find(params[:id])
  end
end
