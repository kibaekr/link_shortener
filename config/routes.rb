Rails.application.routes.draw do
  resources :links, only: [:index, :create]
  root 'links#home_page'

  get 'links/:shortened_hash', to: 'links#show', as: 'show_link'
  get '/:shortened_hash', to: 'links#redirect_to_original_link'
end
