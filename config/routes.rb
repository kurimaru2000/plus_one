Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'

  resources :books do
    collection do
      get 'index2'
    end
    resources :rooms do
      resources :messages
    end
  end
end
