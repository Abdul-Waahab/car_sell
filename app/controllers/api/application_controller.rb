# frozen_string_literal: true

class Api::ApplicationController < ActionController::API
  include Pundit::Authorization

  before_action :set_default_format
  # protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def set_default_format
    request.format = :json
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
