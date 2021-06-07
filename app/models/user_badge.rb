class UserBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user

  validates :badge, :user, presence: true
  validates :user, uniqueness: { scope: :badge }
end
