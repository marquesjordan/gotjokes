class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  def index
  end
  

  # protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def current_profile
    @current_profile ||= Profile.where(user_id: current_user.id).first
  end
  helper_method :current_user
  helper_method :current_profile

end
