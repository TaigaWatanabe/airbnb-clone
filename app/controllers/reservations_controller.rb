class ReservationsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    start_date = Date.parse(params[:reservation][:start_date])
    end_date = Date.parse(params[:reservation][:end_date])

    if is_conflict(start_date, end_date, @room)
      flash[:danger] = "Dates are not available!"
    else
      @reservation = current_user.reservations.new(reservation_params)
      nights = (end_date - start_date).to_i
      @reservation.price = @room.price
      @reservation.total_price = nights * @room.price
      @reservation.room = @room
      @reservation.save!

      flash[:success] = "Booked successfully!"
    end

    redirect_to room_url(@room)
  end

  def your_reservations
    @room_ids = current_user.rooms.pluck(:id)
    @reservations = Reservation.where(room_id: @room_ids)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def is_conflict(start_date, end_date, room)
    check = room.reservations.where(
      "(? <= start_date AND start_date <= ?)
      OR (? <= end_date AND end_date <= ?)
      OR (start_date < ? AND ? < end_date)",
      start_date, end_date,
      start_date, end_date,
      start_date, end_date
    )
    check.size > 0 ? true : false
  end
end
