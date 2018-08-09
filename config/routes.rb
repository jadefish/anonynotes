# frozen_string_literal: true

Rails.application.routes.draw do
  # Search:
  get '/search', to: 'search#search', format: false

  # Note show/new/create:
  resources :notes, param: :identifier, only: [:show, :new], format: false, path: '' do
    resource :likes, only: :create, format: false, path: 'like'
  end
  resources :notes, only: :create, format: false, path: 'new'

  # Index:
  root 'index#index'
end
