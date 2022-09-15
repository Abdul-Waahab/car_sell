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
    respond_to do |format|
      format.js {}  
    end
  end

  def show;end

  def index
    @favourite = Favourite.order(:id).page(params[:page]) 
  end  

end
