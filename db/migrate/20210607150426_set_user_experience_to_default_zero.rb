class SetUserExperienceToDefaultZero < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :experience, :integer, default: 0
  end
end
