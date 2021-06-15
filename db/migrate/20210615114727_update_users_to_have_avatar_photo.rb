class UpdateUsersToHaveAvatarPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_photo, :string
  end
end
