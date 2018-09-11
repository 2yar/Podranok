require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  #index
  context "GET #index" do
    it 'responds 200 with no products' do
      get :index
      expect(response).to be_successful
    end

    it 'responds 200 with products' do
      create :product
      get :index 
      expect(response).to be_successful
    end
  end

  #create action
  context "POST #create" do
    before do 
      @admin = FactoryBot.create(:admin)
      sign_in @admin
    end
    it "successfully creates new product" do  
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
    it "cannot create a product" do 
      expect(Product.new(price:nil)).not_to be_valid
    end  
  end

  #update 
  context "put #update" do
    let(:product) { create(:product) }
    before do 
      @admin = FactoryBot.create(:admin)
      sign_in @admin
    end
    it "successfully updates a product" do
      @update = { name:product.name, id:product.id, price:product.price }
      put :update, params: { id: product.id, product: @update}
      product.reload
      expect(product.name).to eq "Acura"
    end
  end

  #delete 
  context "destroy" do 
    let(:product) { create(:product) }
    before do 
      @admin = FactoryBot.create(:admin)
      sign_in @admin
    end
    it "allows admin to delete a product" do 
      delete :destroy, params: {id: product}
      expect(response).to redirect_to products_path
    end
  end 
end
