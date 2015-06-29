Rails.application.routes.draw do
  root 'home#index'

  delete "/sessions", to: 'sessions#destroy', as: :destroy_session
  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]

  resources :agreements, only: [:new]
end
