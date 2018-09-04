require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:cart) { create :cart }
  let(:product) { create :product, price: 9 }
  let(:line_item) { create :line_item, quantity: 2, cart: cart, product: product }

  describe 'ActiveRecord associations' do
    it { is_expected.to belong_to :order }
    it { is_expected.to belong_to :product }
    it { is_expected.to belong_to :cart }
  end

  describe '#total_price' do
    it 'return correct total_price' do
      expect(line_item.total_price).to eq(9 * 2)
    end
  end
end
