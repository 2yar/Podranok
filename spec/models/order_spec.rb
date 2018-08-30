require 'rails_helper'

RSpec.describe Order do
  let(:order) { FactoryBot.create :order }

  describe 'ActiveRecord associations' do
    it { is_expected.to have_many :line_items }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_inclusion_of(:pay_type).in_array(Order::PAYMENT_TYPES) }
    it { is_expected.to validate_inclusion_of(:type_of_delivery).in_array(Order::TYPE_OF_DELIVERY) }
  end

  describe "add_line_items_from_cart" do
    before do
      @cart = create(:cart)
      2.times { @cart.add_product(create(:product)) }
      @items = @cart.line_items
    end
      
    it "associates line_items with order" do
      order.add_line_items_from_cart(@cart)
      expect(order.line_items).to eq @items
    end

    it "unassociates line_items from cart" do
      order.add_line_items_from_cart(@cart)
      @cart.reload
      expect(@cart.line_items).to be_empty
    end
  end
end
