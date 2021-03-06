ActiveAdmin.register Project do

  member_action :sort do
    @project = Project.find params[:id]
    @slides = @project.slides.order 'position'
  end

  config.clear_action_items!

  action_item :only => :sort do
    link_to('Save', 'javascript:void(0)')
  end

  action_item :only => :index do
    link_to('New Project', new_admin_project_path)
  end

  menu :parent => "Artists"

  index do
    selectable_column
    column :artist
    column :client
    column :title
    column "Thumb" do |project|
      if project.image.present?
        responsive_image_tag project.image.non_retina_thumb.url, :width => 100
      end
    end
    column :created_at
    column "" do |project|
      links = link_to "View", admin_project_path(project)
      links += ' '
      links += link_to "Edit", edit_admin_project_path(project)
      links += ' '
      links += link_to "Delete", admin_project_path(project), :method => :delete
      links += ' '
      links += link_to "Sort", sort_admin_project_path(project)
    end
  end
  form :partial => 'form'

end
