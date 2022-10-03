class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  validates :content, presence: true
end
