Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get 'pages/index'

    get 'pages/about'

    get 'pages/contact'

  #devise_for :users
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "home#index"
    get '/about', to: 'pages#about'
    get '/contact', to: 'pages#contact'
    resources :pageants
    resources :contestants
    resources :users

end
