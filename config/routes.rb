Goldteeth::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :artists

  root :to                                  => "artists#index"
  #get "admin/projects/:id/sort"            => "projects#sort"
  post "admin/projects/:id/update_sort"     => "projects#update_sort", :as         => "sort_slides"
  post "admin/post/:id/update_sort"         => "posts#update_sort", :as            => "sort_post_images"
  post "admin/artists/update_sort"          => "artists#update_sort", :as          => "sort_artists"
  post "admin/artists/update_sort_projects" => "artists#update_sort_projects", :as => "sort_projects"

  get "news"                                => "posts#index",      :as             => "posts"
  get "news/grid"                           => "posts#grid",       :as             => "posts_grid"
  get "news/:id"                            => "posts#show",       :as             => "post"

  get "information"                         => "information#show", :as             => "information"

  get "lightbox"                            => "lightbox#show",    :as             => "lightbox"
  get "lightbox/add/:model/:id"                 => "lightbox#add",     :as             => "lightbox_add"
  get "lightbox/remove/:model/:id"              => "lightbox#remove",  :as             => "lightbox_remove"
  get "lightbox/clear"                      => "lightbox#clear",   :as             => "lightbox_clear"
  get "lightbox/download"                   => "lightbox#pdf",     :as             => "lightbox_pdf"

  get ":name"                               => "artists#show",     :as             => "artist"

  get ":name/:title/grid"                   => "projects#grid",    :as             => "projects_grid"
  get ":name/:title"                        => "projects#show",    :as             => "project"

end
