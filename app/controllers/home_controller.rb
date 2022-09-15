# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    if current_user.present?
      redirect_to dashboard_path
    else
      redirect_to new_user_session_path
    end
  end

  def dashboard
    @show_more = ActiveModel::Type::Boolean.new.cast(params[:show_more])
  end
end
