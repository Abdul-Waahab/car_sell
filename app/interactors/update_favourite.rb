# frozen_string_literal: true

class UpdateFavourite
  include Interactor

  delegate :post, :user, :favourite_exists, to: :context

  def call
    toggle_favourite
  end

  private

  def toggle_favourite
    favourite = user.favourites.exists?(post_id: post.id)
    if favourite
      user.favourites.find_by(post_id: post.id).destroy
      context.favourite_exists = false
    else
      user.favourites.create(post: post)
      context.favourite_exists = true
    end
  end
end
