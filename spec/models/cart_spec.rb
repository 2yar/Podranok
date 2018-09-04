require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe '#add_product(product_id)' do
    let(:cart) { create(:cart) }
    let(:product) { create(:product) }
    let(:line_item) { create(:line_item, product_id: product.id, cart_id: cart.id) }

    it 'increases the number of line_item for the product' do
      expect { cart.add_product(product.id) }.to change(LineItem, :count).by(1)
    end
  end

  describe '#total_price' do
    let(:product) { create :product, price: 9 }
    let(:product_1) { create :product, price: 5 }

    let(:line_item) { create :line_item, quantity: 2, product: product }
    let(:line_item_1) { create :line_item, quantity: 2, product: product_1 }
    let(:cart) { create :cart, line_items: [line_item, line_item_1] }

    it 'retrun correct total_price' do
      expect(cart.total_price).to eq(2*9 + 2*5)
    end
  end
end
