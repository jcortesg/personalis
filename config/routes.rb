Personalis::Application.routes.draw do
  

  # ROUTES FOR DEVISE
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},controllers: {omniauth_callbacks: "omniauth_callbacks"}
  

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  
  resources :users
end