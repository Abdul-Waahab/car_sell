class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  
  def index
    @post = Post.order(created_at: :desc)
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

  def show;end   

  def edit;end

  def update;end

  def destroy
    @post.destroy
    redirect_to root_path
  end    
    
  private 

  def find_post
    @post = Post.find(params[:id])
  end 
  
  def post_params
    params.require(:post).permit(:city, :color, :car_make, :engine_type, :milage, :price, :transmission_type, :engine_capacity, :add_discription, :assembly_type, :user_id)
  end
end

