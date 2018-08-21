require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) }

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_numericality_of :price }
  end

  describe 'ActiveRecord associations' do
    it { is_expected.to have_many :line_items }
    it { is_expected.to belong_to :category }
  end

  describe "product search by price and name" do
    before(:each) do
      @p1 = Product.create(name: "Acura", price: 100, category_id: 1)
      @p2 = Product.create(name: "BMV", price: 50, category_id: 2)
      @p3 = Product.create(name: "Ferrari", price: 150, category_id: 3)
    end
    context "when name 'Fiat'" do
      it "returns an empty array" do
        search_hash = { keyword: "Fiat" }
        expect(Product.search(search_hash)).to be_empty
      end
    end
 
    context "when price '10'" do
      it "returns an empty array" do
        search_hash = { price: 10 }
        expect(Product.search(search_hash)).to be_empty
      end
    end
 
    context "when name 'Acura'" do
      it "returns the product1" do
        search_hash = { keyword: "Acura" }
        expect(Product.search(search_hash)).to match_array([@product1])
      end
    end
 
    context "when price '150'" do
      it "returns the product3" do
        search_hash = { price: 150 }
        expect(Product.search(search_hash)).to match_array([@product3])
      end
    end
  end

  describe "check line items before destroy" do
    context "item has no line items" do
      subject!(:product) { create(:product) }
      it "destroys item" do
        expect { product.destroy }.to change(Product, :count).by(-1)
      end
    end

    context "item has line items" do
      it "does not destroy item" do
        expect { product.destroy }.not_to change(Product, :count)
      end
    end
  end
end

