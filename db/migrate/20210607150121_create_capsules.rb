class CreateCapsules < ActiveRecord::Migration[6.0]
  def change
    create_table :capsules do |t|
      t.references :owner,null: false, foreign_key: { to_table: 'users' }
      t.references :category, null: false, foreign_key: true
      t.date :arrival_date, null: false
      t.boolean :hidden, default: true
      t.text :message
      t.text :title, null: false
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
