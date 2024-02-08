Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :dishes
  resources :meals do
    collection do
      get 'report'
    end
  end
end
