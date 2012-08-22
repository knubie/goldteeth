class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.text :text
      t.text :contact

      t.timestamps
    end
  end
end
