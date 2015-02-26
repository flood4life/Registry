Rails.application.routes.draw do

  root :to => redirect('catalogs')

  resources :catalogs

  resources :products do
    resources :reviews, except: [:index, :show]
  end

end