class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @orders = Order.all
  end

  def show; end

  def new
    if @cart.line_items.empty?
      redirect_to products_path, notice: 'Ваша корзина пуста' 
      return
    end 
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        session[:order_id] = @order.id
        OrderNotifierMailer.received(@order).deliver_later
        format.html { redirect_to products_path, notice: 'Спасибо за ваш заказ.' }
      else
        @cart = set_cart
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Заказ был успешно обновлен.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Заказ был успешно уничтожен.' }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :address, :email, :phone, :pay_type, :type_of_delivery)
  end
end
