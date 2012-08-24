ActiveAdmin.register Project do

  member_action :sort do
    @project = Project.find params[:id]
    @slides = @project.slides.order 'position'
  end

  menu :parent => "Artists"

  index do
    selectable_column
    column :client
    column :title
    column "Thumb" do |project|
      image_tag project.image.url, :width => 100
    end
    column :created_at
    default_actions
  end
  form :partial => 'form'

end
