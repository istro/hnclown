class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.integer :rank
      t.references :users

      t.timestamps
    end
    add_index :links, :users_id
  end
end
