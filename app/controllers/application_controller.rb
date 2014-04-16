class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:handle, :network, :email, :password, :password_confirmation) }
  end

  protect_from_forgery with: :exception


  # helper_method :current_user
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  # end
  

  add_flash_types :success, :info, :warning, :danger
end
