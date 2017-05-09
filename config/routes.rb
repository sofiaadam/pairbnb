Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users do
    resources :listings
  end
  
  resources :reservations

  resources :listings do
    resources :reservations
  end
  
  resources :tags
  
  root 'homes#index'
  post 'homes/search' => 'homes#search'
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/reservations/:rid/payment/new" => "payment#new", as: "payment_new"
  post '/reservations/:rid/payment/checkout' => "payment#checkout", as: "payment_checkout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
