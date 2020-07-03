module ApplicationHelper
  include Pagy::Frontend

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform the action"
      redirect_to login_path
    end
  end

  def require_admin
    if !logged_in?
      flash[:alert] = "You must be logged in to perform the action"
      redirect_to login_path
    end
    if !current_user.is_admin
      flash[:alert] = "You are not authorized to perform this action"
      redirect_to root_path
    end
  end
end
