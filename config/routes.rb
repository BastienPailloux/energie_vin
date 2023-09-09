Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "bottles#index", as: :authenticated_root
  end
  root to: "pages#home"

  resources :bottles, only: [:index]
end
