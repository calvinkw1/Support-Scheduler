Rails.application.routes.draw do

  get '/', to: "users#index", as: 'root'

  get 'shifts/index'

  get 'shifts/new'

  get 'shifts/show'

  get 'shifts/edit'

  get 'users/index'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  # get '/', to: "shift#index", as: 'root'

  # resources :users
  # resources :shifts



#          Prefix Verb   URI Pattern                               Controller#Action
#     user_shifts GET    /users/:user_id/shifts(.:format)          shifts#index
#                 POST   /users/:user_id/shifts(.:format)          shifts#create
#  new_user_shift GET    /users/:user_id/shifts/new(.:format)      shifts#new
# edit_user_shift GET    /users/:user_id/shifts/:id/edit(.:format) shifts#edit
#      user_shift GET    /users/:user_id/shifts/:id(.:format)      shifts#show
#                 PATCH  /users/:user_id/shifts/:id(.:format)      shifts#update
#                 PUT    /users/:user_id/shifts/:id(.:format)      shifts#update
#                 DELETE /users/:user_id/shifts/:id(.:format)      shifts#destroy
#           users GET    /users(.:format)                          users#index
#                 POST   /users(.:format)                          users#create
#        new_user GET    /users/new(.:format)                      users#new
#       edit_user GET    /users/:id/edit(.:format)                 users#edit
#            user GET    /users/:id(.:format)                      users#show
#                 PATCH  /users/:id(.:format)                      users#update
#                 PUT    /users/:id(.:format)                      users#update
#                 DELETE /users/:id(.:format)                      users#destroy


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
