class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def contact
  end

  def about_company
  end

  def info
  end
end
