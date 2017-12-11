class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Item was successfully added to cart' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  params

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
