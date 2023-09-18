class CreateDeclarations < ActiveRecord::Migration[7.0]
  def change
    create_table :declarations do |t|
      t.string :declaration, null: false
      t.text :comment,       null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
