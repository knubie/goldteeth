ActiveAdmin.register Artist do

  menu :priority => 3

  member_action :sort do
    @artists = Artist.order 'position'
  end

  index do
    selectable_column
    column :name
    column "Thumb" do |artist|
      image_tag artist.image.url, :width => 100
    end
    #links += link_to "Sort", sort_admin_artist_path(artist)
    default_actions
  end
  form :partial => 'form'
end
