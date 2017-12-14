class Order < ApplicationRecord
  PAYMENT_TYPES = ["Наличными при получении товара на складе Новой Почты",
                   "Оплата за товар на карту ПриватБанка",
                   "WebMoney.UA"]
  TYPE_Of_DELIVERY = ["Нова почта", "Автолюкс"]

  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :type_of_delivery, inclusion: TYPE_Of_DELIVERY

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
