class Reservation < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title, :image, presence: true
  validates :place, :image, presence: true
  validates :introduction, :image, presence: true  
  validates :image, presence: true
end


