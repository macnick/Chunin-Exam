Rails.application.routes.draw do
  root "links#new"
  resources :links, only: [:new, :create, :show]
end
