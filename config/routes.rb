Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:index] do
    resources :categories, only: [:index, :show, :new, :create] do
      resources :spendings, only: [:index, :show, :new, :create]
    end
  end

  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
end
