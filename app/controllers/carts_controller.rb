class CartsController < ApplicationController
  def create
    @cart = Cart.new

    respond_to do |format|
      if @cart.save
        format.http { redirect_to @cart, notice: 'Line_item was successfully created' }
      else
        format.http { redirect_to products_path }
      end
    end
  end

  def new
    @cart = Cart.new
  end

  def show
  end

  def destroy
  end
end
