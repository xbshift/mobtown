Mobtown::Application.routes.draw do
  get "dance_classes/new"

  root to: 'static_pages#home'
  match '/venue', to: 'static_pages#venue'
  match '/the-location', to: 'static_pages#venue'
  match '/map', to: 'static_pages#map'
  match '/personalities', to: 'static_pages#personalities'
  match '/classes', to: 'dance_classes#index'
  match '/classes/new', to: 'dance_classes#new'
  match '/classes/lindy-hop', to: 'dance_classes#lindy'
  match '/classes/lindy', to: 'dance_classes#lindy'
  match '/classes/swing', to: 'dance_classes#swing'
  match '/classes/salsa', to: 'dance_classes#salsa'
  match '/classes/west-coast', to: 'dance_classes#westcoast'
  match '/classes/belly-dancing', to: 'dance_classes#bellydancing'

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
