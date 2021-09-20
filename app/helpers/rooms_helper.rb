module RoomsHelper
  def is_ready?(room)
    !room.price.blank? && !room.listing_name.blank? && !room.address.blank? && room.photos.length > 0
  end
end
