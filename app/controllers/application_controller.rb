class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_render_cart
  before_action :init_cart
  helper_method :current_user


  def require_login
    redirect_to new_session_path unless session.include? :user_id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?

  def set_render_cart
    @render_cart = true
  end

  def init_cart
    @cart ||= Cart.find_by(id: session[:cart_id]) 

    if @cart.nil?
      @cart = Cart.create
      if session[:user_id] != nil
        set_id
      else
        session[:cart_id] = nil
      end
    end
  end

  def set_id
    session[:cart_id] = current_user.id
  end
  helper_method :set_id

  private
  def redirect_if_success(default_ur)
    redirect_to params[:to] || default_url
    # or similar logic
  end

end
