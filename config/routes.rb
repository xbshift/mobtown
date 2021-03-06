Mobtown::Application.routes.draw do

  # 301 redirects from legacy URLs
  match '/category/mob-blog', to: redirect('/mob-blog')
  match '/mob-blog/why-the-century-ballroom-matters--2', to: redirect('/mob-blog/why-the-century-ballroom-matters')
  match '/blues', to: redirect('/dances/blues') # Marissa's postcards

  get "dance_classes/new"

  namespace :ckeditor, :only => [:index, :create, :destroy] do
      resources :pictures
      resources :attachment_files
  end

  root to: 'static_pages#home'
  match '/venue', to: 'static_pages#venue'
  match '/the-location', to: 'static_pages#venue'
  match '/map', to: 'static_pages#map'
  match '/mobmentality', to: 'static_pages#mob_mentality'
  match '/mob-mentality', to: 'static_pages#mob_mentality'
  match '/dances', to: 'static_pages#dances'
  match '/classes/:category/:id', to: 'dance_classes#index'
  resources :dance_classes, :path => '/classes'
  resources :categories, :path => '/class_categories'
  match '/warroom', to: 'application#login'
  match '/war-room', to: 'application#login'
  match '/war', to: 'application#login'
  match '/balls', to: 'application#login'
  match '/admin', to: 'application#login'
  match '/bar', to: 'bulk_signups#new'
  match '/videos', to: 'static_pages#videos'
  resources :staff, :except => [:show]
  resources :events do
    collection do
      get :manage
    end
    resources :occurrences
  end
  resources :passes do
    collection do
      post :bulk_signup
    end
    resources :registrations do
      collection do
        post :checkout
        post :charge
      end
      member do
        get :void
        get :unvoid
      end
    end
  end
  resources :rental_inquiries
  resources :posts, :path => '/mob-blog'
  resources :feature_boxes
  resources :charges
  resources :bulk_signups

  match '/acquire', to: 'static_pages#acquire'
  match '/yelp-example', to: 'static_pages#yelp_example'


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
