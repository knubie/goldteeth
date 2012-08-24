ActiveAdmin.register Artist do

  menu :priority => 3

  index do
    selectable_column
    column :name
    column "Thumb" do |artist|
      image_tag artist.image.url, :width => 100
    end
    default_actions
  end
  form :partial => 'form'
end
