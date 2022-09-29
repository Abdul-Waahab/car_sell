# frozen_string_literal: true

class Api::PostsController < Api::ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  before_action :authorization, except: %i[show index new create]
  before_action :authenticate_user!
  def index
    @posts = Post.all
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
    @post.update(post_params)
  end

  def destroy
    @post.destroy
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
