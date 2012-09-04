ActiveAdmin.register Artist do

  menu :priority => 3

  collection_action :sort do
    @artists = Artist.order 'position'
  end

  member_action :sort_projects do
    @artist = Artist.find params[:id]
    @projects = @artist.projects.order 'position'
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
    column "" do |artist|
      links = link_to "View", admin_artist_path(artist)
      links += ' '
      links += link_to "Edit", edit_admin_artist_path(artist)
      links += ' '
      links += link_to "Delete", admin_artist_path(artist), :method => :delete
      links += ' '
      links += link_to "Sort Projects", sort_projects_admin_artist_path(artist)
    end
  end
  form :partial => 'form'
end
