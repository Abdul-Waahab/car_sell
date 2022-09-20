# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get :dashboard, controller: :home
  resources :posts
  resources :post_steps
  resources :favourites
  resources :checkout, only: [:create]
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
