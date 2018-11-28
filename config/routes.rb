Rails.application.routes.draw do
  get 'sessions/login'
  get 'sessions/logout'
  get 'login/logout'
  get 'registration' => 'users#new'#, as: 'registration'
  post 'users' => 'users#create'
  post 'sessions' => 'sessions#create'

  resources :posts do
    resources :comments
    # member do
    #   post 'vote_up'
    #   post 'vote_down'
    # end
  end

  # namespace :api do
  #   resources :posts
  # end

  # resources :posts, only: [:index, :show]
  # scope :admin do
  #     resources :posts
  # end

  root 'posts#index'
end
