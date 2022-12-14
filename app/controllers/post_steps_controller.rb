# frozen_string_literal: true

class PostStepsController < ApplicationController
  include Wicked::Wizard
  steps :details, :picture, :contact
  before_action :find_post, only: [:show, :update]

  def show
    render_wizard
  end

  def update
    case step
    when :picture then @post.update(detail_params)
    when :contact then @post.update(image_params)
    end
    if params[:id] == 'wicked_finish'
      @post.update(contact_params)
      render 'wicked_finish'
    else
      render_wizard
    end
  end

  def wicked_finish; end

  private

  def find_post
    @post = if post_id.present?
              Post.find_by(id: post_id)
            else
              Post.new
            end
  end

  def post_id
    params[:post].present? ? params[:post][:post_id] : params[:post_id]
  end

  def detail_params
    params.require(:post).permit(:city, :color, :car_make, :engine_type, :milage, :price, :transmission_type,
                                 :engine_capacity, :add_discription, :assembly_type, :user_id)
  end

  def image_params
    params.require(:post).permit(pictures: [])
  end

  def contact_params
    params.require(:post).permit(:primary_contact, :secondary_contact, :user_id)
  end
end
