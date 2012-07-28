class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :content_id
      t.string :content_type

      t.timestamps
    end
  end
end
