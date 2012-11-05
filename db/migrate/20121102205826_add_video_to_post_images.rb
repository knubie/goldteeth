class AddVideoToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :video, :string
  end
end
