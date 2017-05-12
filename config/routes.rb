Rails.application.routes.draw do
  

  get 'sessions/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  scope module: 'deploy' do
    get  'deploy/authorize/callback', to: 'authorize#callback'
    get  'deploy/authorize', to: 'authorize#authorize'
  end
  
  get 'home/aboutus' => 'home#aboutus'
  get 'home/contactus' => 'home#contactus'
  
  resources :user, :only => [:new, :create, :show, :edit, :update]
  
  #get 'user/new' => 'user#new'
  #post 'user/create' => 'user#create'
  #get 'user/:id' => 'user#show'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get 'products/SS Gal 1' => 'products#ssg1'
  get 'products/EYE Phone 1' => 'products#eyep1'
  get 'products/LEN L1' => 'products#lenl1'

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
