class StoreController < ApplicationController
  skip_before_action :require_login
  def index
    redirect_to store_path
  end
end
