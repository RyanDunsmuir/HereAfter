class Recipient < ApplicationRecord
  belongs_to :user
  belongs_to :capsule
end
