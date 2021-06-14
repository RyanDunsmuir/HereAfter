class UpdateCapsuleArrivalTimeToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :capsules, :arrival_date, :datetime
  end
end
