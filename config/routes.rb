Rails.application.routes.draw do

  # ––––––––––––– Clearance Stuff ––––––––––––––––––––––
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"

  # For Oauth routing
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # Landing Page 
  resources :welcome, only: [:index]
end
