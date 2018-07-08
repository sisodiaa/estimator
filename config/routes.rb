Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :passwords]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :belts

  resources :machines do
    resources :machine_belts, as: 'belts', path: '/belts'
  end

  resources :mills, param: :code do
    resources :mill_machines, as: 'machines', path: '/machines'
  end

  get '/search', to: 'dashboard#show', as: 'search'

  namespace :api do
    get '/query', to: 'queries#show'
  end

  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
