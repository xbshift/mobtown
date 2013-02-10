Mobtown::Application.routes.draw do

  get "dance_classes/new"

  root to: 'static_pages#home'
  match '/venue', to: 'static_pages#venue'
  match '/the-location', to: 'static_pages#venue'
  match '/map', to: 'static_pages#map'
  match '/staff', to: 'static_pages#staff'
  match '/mobmentality', to: 'static_pages#mob_mentality'
  match '/mob-mentality', to: 'static_pages#mob_mentality'
  match '/dances', to: 'static_pages#dances'
  Category.all.each do |c|
    match 'classes/' + c.slug + '/(:id)', to: 'dance_classes#index', category: c.slug
  end
  resources :dance_classes, :path => '/classes'
  resources :categories, :path => '/class_categories'
  match '/warroom', to: 'application#login'
  match '/war-room', to: 'application#login'
  match '/war', to: 'application#login'
  match '/balls', to: 'application#login'
  match '/admin', to: 'application#login'
  match '/videos', to: 'static_pages#videos'
  resources :events
  resources :posts, :path => '/mob-blog'
  resources :feature_boxes

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
