Rails.application.routes.draw do
  resources :sales
  resources :cities, only: %i[index]

  mount ActionCable.server => '/cable'
end
