ActiveAdmin.register Post do

  menu :label => "News", :priority => 2

  index do
    selectable_column
    column :client
    column "Thumb" do |post|
      image_tag post.thumb.url, :width => 100
    end
    column :created_at
    default_actions
  end

  filter :artist
  filter :client
  filter :body
  filter :created_at

  form :partial => 'form'

end
