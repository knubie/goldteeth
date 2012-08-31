Goldteeth::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :artists

  root :to => "artists#index"
  #get "admin/projects/:id/sort" => "projects#sort"
  post "admin/projects/:id/update_sort"   => "projects#update_sort", :as => "sort_slides"
  post "admin/post/:id/update_sort"   => "posts#update_sort", :as => "sort_post_images"
  post "admin/artists/update_sort"   => "artists#update_sort", :as => "sort_artists"

  get "news"              => "posts#index",      :as => "posts"
  get "news/grid"         => "posts#grid",       :as => "posts_grid"
  get "news/:id"          => "posts#show",       :as => "post"

  get "information"       => "information#show", :as => "information"

  get "lightbox"          => "lightbox#show",    :as => "lightbox"
  get "add/:slide"        => "lightbox#add",     :as => "lightbox_add"
  get "remove/:slide"     => "lightbox#remove",  :as => "lightbox_remove"
  get "clear"             => "lightbox#clear",   :as => "lightbox_clear"
  get "download"          => "lightbox#pdf",     :as => "lightbox_pdf"

  get ":name"             => "artists#show",     :as => "artist"

  get ":name/:title/grid" => "projects#grid",    :as => "projects_grid"
  get ":name/:title"      => "projects#show",    :as => "project"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
