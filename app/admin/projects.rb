ActiveAdmin.register Project do
  member_action :sort do
    @project = Project.find params[:id]
    @slides = @project.slides.order 'position'
  end
  form :partial => 'form'
end
