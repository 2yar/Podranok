class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
