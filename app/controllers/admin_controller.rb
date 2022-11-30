class AdminController < ApplicationController
  def index
    redirect_to store_path unless current_user.admin
  end
  
end
