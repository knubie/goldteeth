ActiveAdmin.register Artist do

  menu :priority => 3

  collection_action :sort do
    @artists = Artist.order 'position'
  end

  action_item do
    link_to('Sort Artists', sort_admin_artists_path)
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
