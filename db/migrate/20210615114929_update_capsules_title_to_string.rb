class UpdateCapsulesTitleToString < ActiveRecord::Migration[6.0]
  def change
    change_column :capsules, :title, :string
  end
end
