class AdminController < ApplicationController
  def index
    @adminuser = current_user
    if @adminuser.admin == true
      render "admin/admin_html"
    else
      redirect_to store_path
    end
  end
end
