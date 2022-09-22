# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  alias post record

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.id == post.user_id
  end

  def update?
    user.id == post.user_id
  end

  def destroy?
    user.id == post.user_id
  end
end
