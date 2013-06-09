Personalis::Application.routes.draw do
  



  resources :profiles

  match '/campaigns', to: 'campaigns#new' 


  # ROUTES FOR DEVISE
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},controllers: {omniauth_callbacks: "omniauth_callbacks"}
  

  authenticated :user do
    root :to => 'users#profile'
  end
  root :to => "home#index"
  
  resources :users
end
