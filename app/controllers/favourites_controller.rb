# frozen_string_literal: true

class FavouritesController < ApplicationController
  before_action :set_post, only: %i[update]

  def update
    result = UpdateFavourite.call(post: @post, user: current_user)
    @favourite_exists = result.favourite_exists
  end

  def show; end

  def index
    @favourites = Favourite.order(:id).page(params[:page])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
