Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root :to => redirect('catalogs')

  resources :catalogs

  resources :products do
    resources :reviews, except: [:index, :show] do
      get 'approve', on: :member
    end
  end

end