require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  context "#index" do
    before do 
      @admin = FactoryBot.create(:admin)
      sign_in @admin
    end
    it "responds 200 with orders" do
      create :order
      get :index
      expect(response).to be_successful
    end
    
    it 'responds 200 with no orders' do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST create" do
    it "creates a new order" do
      expect { 
        post :create, params: { order: FactoryBot.attributes_for(:order)}
      }.to change(Order,:count).by(1)
    end
      
    it "redirects to the main page" do
      post :create, params: { order: FactoryBot.attributes_for(:order)}
      expect(response).to redirect_to products_path
      expect(flash[:notice]).to include("Спасибо за ваш заказ.")
    end
  end


  context "GET new" do
    it "redirects to the main page if the cart is empty" do
      get :new
      expect(response).to redirect_to products_path
      expect(flash[:notice]).to include("Ваша корзина пуста")
    end
  end

  context "put #update" do
    let(:order) { create(:order) }
    before do 
      @admin = FactoryBot.create(:admin)
      sign_in @admin
    end
    it "successfully updates a order" do
      @update = { name:order.name, id:order.id, address:order.address }
      put :update, params: { id: order.id, order: @update}
      order.reload
      expect(order.name).to eq "order 1"
    end
  end

  context "destroy" do 
    let(:order) { create(:order) }
    before do 
      @admin = FactoryBot.create(:admin)
      sign_in @admin
    end
    it "allows admin to delete a product" do 
      delete :destroy, params: {id: order}
      expect(response).to redirect_to orders_path
    end
  end
end
