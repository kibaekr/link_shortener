Rails.application.routes.draw do
  resources :links, only: [:index, :create]
  root 'links#index'

  get '/:shortened_hash', to: 'links#show'
end
