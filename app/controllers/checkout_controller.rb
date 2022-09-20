# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :set_post

  def create
    @session = stripe_session
    respond_to { |format| format.js }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def stripe_product
    Stripe::Product.create({ name: @post.add_discription })
  end

  def stripe_price
    Stripe::Price.create({
                           unit_amount: 2000,
                           currency: 'usd',
                           product: stripe_product.id,
                         })
  end

  def stripe_session
    Stripe::Checkout::Session.create({
                                       payment_method_types: ['card'],
                                       line_items: [{
                                         price: stripe_price.id,
                                         quantity: 1,
                                       }],
                                       mode: 'payment',
                                       success_url: root_url,
                                       cancel_url: root_url,
                                     })
  end
end
