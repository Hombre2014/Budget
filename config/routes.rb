Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :categories, only: [:index, :show, :new, :create] do
      resources :spendings, only: [:index, :show, :new, :create]
    end
  end

  # post "/users//categories/new" => 'categories#create'
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
end
