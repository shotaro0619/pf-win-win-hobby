Rails.application.routes.draw do
  get 'genres/index' => 'genres#index', as: 'genres'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :hobbies
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
