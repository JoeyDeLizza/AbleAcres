class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  def new
  end

  def create
    session_params = params.permit(:email, :password, :authenticity_token, :commit)
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:notice] = "Login is invalid!"
      redirect_to new_session_path
    end

  end


  def destroy
    reset_session
    @current_user = nil
    flash[:notice] = "You have been signed out!"
    redirect_to new_session_path
  end
end
