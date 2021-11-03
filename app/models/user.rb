class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :rooms, :dependent => :destroy
  has_many :reservations, dependent: :destroy
end
