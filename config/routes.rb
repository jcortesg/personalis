Personalis::Application.routes.draw do
  


  resources :categories


  #ROUTES CAMPINGS

  resources :campaigns do
      get 'user'
      post 'update_user'
  end

  
  #ROUTES KIES
  resources :keys

  #ROUTES PROFILE
  resources :profiles

  # ROUTES FOR DEVISE
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},controllers: {omniauth_callbacks: "omniauth_callbacks"}
  

  authenticated :user do
    root :to => 'users#profile'
  end
  
  root :to => "home#index"
  


  resources :users do
    collection do
        get 'metrics'
    end
  
  end
end
