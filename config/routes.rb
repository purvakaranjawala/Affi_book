Rails.application.routes.draw do
  get 'likeships/index'
  get 'comments/index'
  get 'posts/index'
  get 'posts/new'
  get 'profiles/dashboard'
  get 'friendships/show_friend_request'
  get 'profiles/my_account'
  get  'posts/my_post'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # get  'customers/new'
  # You can have the root of your site routed with "root"
  root 'profiles#dashboard'
  resources :posts do 
    resources :comments
  end
  resources :relationships
  resources :friendships
  resources :likeships
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
   # resources :customers
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    resources :profiles
  end
  # Example resource route (maps HTTP verbs to controller actions automatically):
  # Example resource route with options:
  # resources :friendships do
  #   member do
  #     get 'friend_request'
  #     get 'friend_'
              
  #       post 'toggle'
  #     end
  # =>        
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
