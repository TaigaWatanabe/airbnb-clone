class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new # Create new room object
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:success] = "Saved succesfully"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def listing
    @room = Room.find(params[:id])
  end

  def price
    @room = Room.find(params[:id])
  end

  def description
    @room = Room.find(params[:id])
  end

  def photos
    @room = Room.find(params[:id])
  end

  def amenities
    @room = Room.find(params[:id])
  end

  def location
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodation, :bedroom_count, :bathroom_count, :user_id, :price, :listing_name, :summary,
    :has_tv, :has_kitchen, :has_heating, :has_air_conditioning, :address, :is_active)
  end  
end
