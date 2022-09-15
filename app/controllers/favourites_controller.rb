# frozen_string_literal: true

class FavouritesController < ApplicationController
  def update
    favourite = Favourite.where(post: Post.find(params[:post]), user: current_user)
    if favourite == []
      favourite.create(post: Post.find(params[:post]), user: current_user)
      @favourite_exists = true
    else
      favourite.destroy_all
      @favourite_exists = false
    end
    respond_to { |format| format.js }
  end

  def show; end

  def index
    @favourites = Favourite.order(:id).page(params[:page])
  end
end
