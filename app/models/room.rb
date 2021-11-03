class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true, numericality: true
    validates :adress, presence: true
    validates :room_image, presence: true
    has_one_attached :room_image
    has_one_attached :profile_image
    belongs_to :user
    has_many :reservations, dependent: :destroy
end
