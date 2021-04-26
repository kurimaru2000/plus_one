Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'

  resources :books do
    collection do
      get 'index_book_list'
    end
    collection do
      get 'index_room_list'
    end
    collection do
      get 'index_concept'
    end
    collection do
      get 'index_use'
    end


    resources :rooms do
      resources :messages
    end
  end
end
