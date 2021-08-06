Rails.application.routes.draw do
  get 'genres/index' => 'genres#index', as: 'genres'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  get '/search' => 'searches#search'
  get 'hobbies/teacher'
  get 'hobbies/student'
  resources :hobbies
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :users, only: [:show,:edit,:update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
