class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :image
      t.references :project

      t.timestamps
    end
    add_index :slides, :project_id
  end
end
