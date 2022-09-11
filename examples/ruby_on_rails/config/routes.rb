Rails.application.routes.draw do
  resources :languages

  root 'home#index'
end
