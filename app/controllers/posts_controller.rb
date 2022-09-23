# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  before_action :authorization, except: %i[show index new create]

  def index
    @post = Post.order(:id).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_steps_path
    else
      render :new
    end
  end

  def show
    @favourite_exists = Favourite.where(post: @post, user: current_user) != []
  end

  def edit; end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path, alert: 'Try Later'
    end
  end

  private

  def authorization
    authorize @post
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:city, :color, :car_make, :engine_type, :milage, :price, :transmission_type,
                                 :engine_capacity, :add_discription, :assembly_type, :user_id)
  end
end
