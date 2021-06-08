class Category < ApplicationRecord
  validates :name, presence: true

  has_many :capsules, dependent: :destroy
end
