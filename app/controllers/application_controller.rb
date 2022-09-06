# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

	protected
	
  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :email, :password)}
  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :password)} 
	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number, :email, :password, :current_password)}
  end
end
