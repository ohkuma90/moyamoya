class CreateWorries < ActiveRecord::Migration[7.0]
  def change
    create_table :worries do |t|
      t.text :text,           null: false
      t.integer :category_id, null: false
      t.string :title,        null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
