class PagesController < ApplicationController
  def home
    @rooms = Room.where(is_active: true)    
  end
end
