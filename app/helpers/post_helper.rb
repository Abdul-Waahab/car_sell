# frozen_string_literal: true

module PostHelper
  def favourite_text
    @favourite_exists ? 'unfavourite' : 'favourite'
  end
end
