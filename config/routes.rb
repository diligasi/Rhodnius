Rhodnius::Application.routes.draw do

  ## Showing Devise witch controller to use
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  ## Configuring Devise's routes
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/register' => 'devise/registrations#new'
    get '/logoff' => 'devise/sessions#destroy'
  end

  ## Routes for SetLanguage controller
  get '/en' => 'set_language#english', :as => :english
  get '/pt-BR' => 'set_language#portuguese', :as => :portuguese
  get '/es' => 'set_language#spanish', :as => :spanish
  get 'set_language/set_session_and_redirect'

  ## Normal page's routes
  get '/about' => 'about#index', :as => :about
  get '/cameras' => 'cameras#index', :as => :cameras

  ## Resources' Pages
  resources :cameras
  resources :comments

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
