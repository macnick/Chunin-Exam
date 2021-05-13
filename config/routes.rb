Rails.application.routes.draw do
  root "links#new"
  resources :links, only: [:new, :create, :show]
  get '/s/:shortened', to: 'links#redirect', as: :shortened
end
