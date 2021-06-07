class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  has_many :badges, through: :user_badges
  has_many :recipients
  has_many :capsules, through: :recipients
  has_many :owned_capsules, class_name: 'Capsule', foreign_key: 'owner_id'
  # this means user.owned_capsules = outgoing capsules
  # user.capsules = incoming and received capsules

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :username, presence: true
end
