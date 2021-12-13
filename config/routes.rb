# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'adventures#index'

  get 'sessions/new'
  post '/sessions/create_or_update_session' => 'sessions#create_or_update_session'

  resources :adventures
  resources :users

  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
end
