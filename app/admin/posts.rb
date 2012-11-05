ActiveAdmin.register Post do

  menu :label => "News", :priority => 2

  member_action :sort do
    @post = Post.find params[:id]
    @post_images = @post.post_images.order 'position'
  end

  index do
    selectable_column
    column :client
    column "Thumb" do |post|
      responsive_image_tag post.post_images.first.image.non_retina_thumb.url, :width => 100
    end
    column :created_at
    column "" do |post|
      links = link_to "View", admin_post_path(post)
      links += ' '
      links += link_to "Edit", edit_admin_post_path(post)
      links += ' '
      links += link_to "Delete", admin_post_path(post), :method => :delete
      links += ' '
      links += link_to "Sort", sort_admin_post_path(post)
    end
  end

  filter :artist
  filter :client
  filter :body
  filter :created_at

  form :partial => 'form'

end
