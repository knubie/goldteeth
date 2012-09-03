class AddCaptionToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :caption, :string
  end
end
