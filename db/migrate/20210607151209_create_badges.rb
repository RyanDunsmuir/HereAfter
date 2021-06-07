class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.integer :experience, default: 0
      t.boolean :locked, default: true
      t.text :image_url, null: false
      t.text :title, null: false
      t.text :description, null: false
      t.text :hint, null: false

      t.timestamps
    end
  end
end
