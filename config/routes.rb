 Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  root "home#index"
  namespace :user do
    get '/profile', to: 'home#profile' 
    get '/edit_profile', to: 'home#edit_profile'
    patch '/update_profile', to: 'home#update_profile'
    get '/home', to: 'home#index'
    post '/create_comment', to: 'tickets#create_comment'
    get 'solved_by_user/:id', to: 'tickets#solved_by_user', as: 'solved_by_user'
    resources :tickets    
  end
  namespace :admin do
    get '/profile', to: 'home#profile'
    get '/edit_profile', to: 'home#edit_profile'
    patch '/update_profile', to: 'home#update_profile'
    get '/show_all_users', to: 'home#show_all_users'
    get '/home', to: 'home#index'
    get '/assign_manager/:id', to: 'tickets#assign_manager'
    post 'tickets/create_comment', to: 'tickets#create_comment'
    resources :subjects do
      member do
        delete 'remove_manager'
      end
    end
    resources :tickets 
    resources :manager 
  end
  namespace :managers do
    resources :tickets
    resources :home
    get '/profile', to: 'home#profile'
    get '/edit_profile', to: 'home#edit_profile'
    patch '/update_profile', to: 'home#update_profile'
    post '/create_comment', to: 'tickets#create_comment'
    get 'resolved_by_manager/:id', to: 'tickets#resolved_by_manager', as: 'resolved_by_manager'
  end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


