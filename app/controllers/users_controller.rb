class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def show
    @user = User.find(session[:user_id])   
  end

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      puts session[:user_id]
      puts @user.id
      redirect_to users_path
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to new_user_path
    end
  end

  def admin
    @user = current_user
    if @user.admin == true
      render admin_path
    else
      redirect_to store_path
    end
  end

  def accountmenu
    redirect_to request.path
  end

  def update
    @current_user = current_user
    @user_params = params[:user]
    @current_user.FirstName = @user_params[:FirstName]
    @current_user.save

    redirect_to users_path
  end

  def edit
    @user = current_user
  end


  private 
  def user_params
    params.require(:user).permit(:email, :password, :FirstName, :LastName)
  end
end
