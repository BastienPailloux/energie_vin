Rails.application.routes.draw do
  devise_for :users, path: 'accounts'
  authenticated :user do
    root to: "bottles#index", as: :authenticated_root
  end
  root to: "pages#home"

  resources :bottles, only: %i[index show] do
    resources :ratings, only: %i[create]
    resources :sells, only: %i[index]
  end
  resources :user do
    resources :searches, only: %i[index show create]
  end
end
