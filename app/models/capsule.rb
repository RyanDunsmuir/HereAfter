class Capsule < ApplicationRecord
  has_one_attached :video, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :recipients, dependent: :destroy
  has_many :users, through: :recipients

  belongs_to :owner, class_name: 'User'
  belongs_to :category

  validates :category, :arrival_date, :title, presence: true

  default_scope -> { order(arrival_date: :desc) }
  scope :not_arrived, -> { where(arrival_date: Time.current..) }
  scope :arrived, -> { where(arrival_date: (Time.current - 1000.years)..Time.current) }
  scope :unread, -> { where(read: false) }
  scope :read, -> { where(read: true) }
end

# capsule.owner > who made the capsules
# capsule.users > people who are recieving the capsule
