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
    @result = PgSearch.multisearch(search_params.values).page(params[:page])
    @show_more = ActiveModel::Type::Boolean.new.cast(params[:show_more])
  end

  private

  def search_params
    params.permit(:car_make, :city, :price, :engine_type, :transmission_type, :color, :milage, :engine_capacity,
                  :assembly_type)
  end
end
