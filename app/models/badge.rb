class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, :image_url, :description, :hint, presence: true
end
