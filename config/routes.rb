Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  
  resources :hobbies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
