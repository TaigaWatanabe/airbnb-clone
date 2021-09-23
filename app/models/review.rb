class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :room
  belongs_to :user
end
