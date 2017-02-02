Rails.application.routes.draw do

  root 'orders#index'

  resources :orders do
    member do
      put :toggle
    end
  end

  resources :weeks

  get 'import', to: 'upload#index'
  post 'import', to: 'upload#import'

end
