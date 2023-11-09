# frozen_string_literal: true

Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do 
    resources :articles do
      resources :comments
    end
  end
end
