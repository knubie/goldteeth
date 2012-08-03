class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :subtitle
      t.string :client
      t.references :artist

      t.timestamps
    end
    add_index :projects, :artist_id
  end
end
