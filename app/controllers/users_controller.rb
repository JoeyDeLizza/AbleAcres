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
      redirect_to users_path
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to new_session_path
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
