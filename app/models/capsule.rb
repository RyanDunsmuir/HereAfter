class Capsule < ApplicationRecord
  has_one_attached :video
  has_one_attached :photo
  has_many :recipients
  has_many :users, through: :recipients

  belongs_to :owner, class_name: 'User'
  belongs_to :category

  #validates :user, :category, :arrival_date, :title, presence: true
end

# capsule.owner > who made the capsules
# capsule.users > people who are recieving the capsule
