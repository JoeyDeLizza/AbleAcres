module ApplicationHelper
  def logged_in?
    if @current_user == nil
      return false
    else
      return true
    end
  end
end
