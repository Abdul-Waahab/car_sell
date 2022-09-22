# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :set_post

  def create
    @session = CreateCheckout.call(post: @post, success_or_cancel_url: root_url).session
    respond_to { |format| format.js }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
