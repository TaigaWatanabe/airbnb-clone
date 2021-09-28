class PagesController < ApplicationController
  def home
    @rooms = Room.where(is_active: true)    
  end

  def search
    @rooms = Room.where(is_active: true)
  end
end
