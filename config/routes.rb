Rails.application.routes.draw do
  get 'sessions/login'
  get 'sessions/logout'
  get 'login/logout'
  get 'registration' => 'users#new'#, as: 'registration'
  post 'users' => 'users#create'
  post 'sessions' => 'sessions#create'

  resources :posts do
    resources :comments
  end

  root 'posts#index'
end
