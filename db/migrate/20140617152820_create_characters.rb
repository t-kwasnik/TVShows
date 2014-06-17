class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :television_show_id, null: false
      t.string :character, null: false
      t.string :actor, null: false
      t.text :description
      t.timestamps
    end

    add_index :characters, :character, unique: true

  end
end
