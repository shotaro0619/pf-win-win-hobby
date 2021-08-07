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

  # お問い合わせ機能
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'thanks', to: 'contacts#thanks', as: 'thanks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
