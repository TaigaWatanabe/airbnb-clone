class RoomsController < ApplicationController
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

  private
  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodation, :bedroom_count, :bathroom_count, :user_id, :price, :listing_name, :summary,
    :has_tv, :has_kitchen, :has_heating, :has_air_conditioning, :address, :is_active)
  end  
end
