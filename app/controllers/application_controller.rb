class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :belongs_to_user

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_url
    end
  end
  def belongs_to_user

    if !(current_user.id.to_s == params[:id])
      redirect_to root_path
    end
    # @current_user ||= image.user.id if session[:user_id]
  end
end
