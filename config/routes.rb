Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root :to => redirect('catalogs')

  resources :catalogs, only: [:index, :show]

  resources :products, only: [:show] do
    resources :reviews, except: [:index, :show]
  end

  resources :reviews, only: [] do
    get 'pending', on: :collection
    get 'approve', on: :member
  end

end