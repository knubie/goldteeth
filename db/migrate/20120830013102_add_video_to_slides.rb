class AddVideoToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :video, :string
  end
end
