Rails.application.routes.draw do
  resources :notes, param: :identifier, only: [:show, :new], format: false, path: '' do
    resource :likes, only: :create, format: false, path: 'like'
  end
  resources :notes, only: [:create], format: false, path: 'new'

  root 'index#index'
end
