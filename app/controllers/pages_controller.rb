class PagesController < ApplicationController
  def home
    @rooms = Room.where(is_active: true)
    @review = Review.new
  end
end
