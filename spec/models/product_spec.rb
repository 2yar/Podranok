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
      @p1 = FactoryBot.create(:product)
      @p2 = FactoryBot.create(:product, name: "Fiat", price: 555)
    end

    context "when name 'Acura'" do
      it "returns the p1" do
        expect(Product.search("Acura")).to match_array([@p1])
      end
    end

    context "when name 'Acura'" do
      it "returns the p2" do
        expect(Product.search("Fiat")).to match_array([@p2])
      end
    end

    context "when price '100'" do
      it "returns the p1" do
        expect(Product.search(100)).to match_array([@p1])
      end
    end

    context "when price '555'" do
      it "returns the p2" do
        expect(Product.search(555)).to match_array([@p2])
      end
    end

    context "when price '10'" do
      it "returns an empty array" do
        expect(Product.search(33)).to be_empty
      end
    end

    context "when name 'Ferrari'" do
      it "returns an empty array" do
        expect(Product.search("Ferrari")).to be_empty
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
