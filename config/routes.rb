Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  get 'switch_user', to: 'switch_user#set_current_user'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :reviews, only: [] do
    get 'pending', on: :collection
    get 'approve', on: :member
  end

  resources :catalogs, only: [:index, :show], path: '/' do
    resources :products, only: [:show], path: '/' do
      resources :reviews, except: [:index, :show]
    end
  end

end