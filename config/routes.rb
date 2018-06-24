Rails.application.routes.draw do
  resources :machines

  resources :mills, param: :code do
    resources :mill_machines, as: 'machines', path: '/machines'
  end

  get '/search', to: 'dashboard#show', as: 'search'

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
