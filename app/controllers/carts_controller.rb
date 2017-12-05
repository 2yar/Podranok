class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def create
    if @cart.save
      redirect_to @cart, notice: 'Line_item was successfully created'
      else
      redirect_to products_path
    end
  end

  def new
    @cart = Cart.new
  end

  def show
  end

  def destroy
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])    
  end
end
