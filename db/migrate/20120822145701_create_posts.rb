class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :artist
      t.string :client
      t.text :body
      t.string :thumb

      t.timestamps
    end
  end
end
