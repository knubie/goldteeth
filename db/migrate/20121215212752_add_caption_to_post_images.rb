class AddCaptionToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :caption, :string
  end
end
