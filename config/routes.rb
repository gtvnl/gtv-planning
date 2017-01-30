Rails.application.routes.draw do

  resources :orders
  root 'upload#index'

  resources :pages

  get 'import', to: 'upload#index'
  post 'import', to: 'upload#import'

end
