Rails.application.routes.draw do
  resources :birds, only: [:index, :show, :create]
  #add :create when making a post request
end
