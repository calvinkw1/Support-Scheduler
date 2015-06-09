Rails.application.routes.draw do

  get '/', to: "users#index", as: 'root'

  get 'shifts/index'

  get 'shifts/new'

  get 'shifts/show'

  get 'shifts/edit'

  get 'users/index'

  get 'users/new'

  get 'users/show/:id', to: 'users#show', as: 'users_show'

  get 'users/edit'

  # get '/', to: "shift#index", as: 'root'

  # resources :users do
  #   resources :shifts
  # end

#       Prefix Verb URI Pattern                 Controller#Action
#         root GET  /                           users#index
# shifts_index GET  /shifts/index(.:format)     shifts#index
#   shifts_new GET  /shifts/new(.:format)       shifts#new
#  shifts_show GET  /shifts/show(.:format)      shifts#show
#  shifts_edit GET  /shifts/edit(.:format)      shifts#edit
#  users_index GET  /users/index(.:format)      users#index
#    users_new GET  /users/new(.:format)        users#new
#   users_show GET  /users/show/:user(.:format) users#show
#   users_edit GET  /users/edit(.:format)       users#edit

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
