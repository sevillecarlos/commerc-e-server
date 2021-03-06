# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      post 'session', to: 'session#create'
      resources :credits
      resources :receipts
      resources :articles
    end
  end
end
