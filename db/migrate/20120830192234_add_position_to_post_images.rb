class AddPositionToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :position, :integer
  end
end
