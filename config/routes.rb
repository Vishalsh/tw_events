TwEvents::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :topics do
    get 'vote_for/:id', to: 'topics#vote_for', on: :collection
    get 'contribute_for/:id', to: 'topics#contribute_for', on: :collection
    get 'get_speakers/:id', to: 'topics#get_speakers', on: :collection
    get 'add_speakers/:id', to: 'topics#add_speakers', on: :collection
    get 'revoke_vote/:id', to: 'topics#revoke_vote', on: :collection
  end

  get ':id/:event_name/talks', to: 'topics#index'
  #match '/topics/create', controller: 'topics#create', via: [:post]
  #match '/topics/update', controller: 'topics#update', via: [:put]

  get ':id/:event_name/my_talks', to: 'users#my_talks'
  get '/events/:id/message', to: 'events#message'
  put '/events/:id/message/:value', to: 'events#update_message'

  resources :admin_users do
    get 'my_events', to: 'admin_users#my_events', on: :collection
  end

  resources :events, :users, :topics

  resources :sessions, only: [:new, :create, :destroy]

  get '/logout', to: 'sessions#destroy'

  root 'events#index'

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
