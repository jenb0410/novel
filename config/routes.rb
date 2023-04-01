Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :stories do
    resources :chapters, except: [:index, :show]
  end
  resources :chapters, only: [:show] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get 'stories', to: 'stories#index'
      get 'comments', to: 'comments#index'
    end
  end

  resources :tags, only: [:create, :destroy]

  get '/search', to: 'search#index'
  
end
