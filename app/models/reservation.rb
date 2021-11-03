class Reservation < ApplicationRecord
    validates  :start_date, presence: true
    validates  :start_date, presence: true
    belongs_to :user
    belongs_to :room


end
