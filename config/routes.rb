Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :tasks

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
 end

  root to: 'welcome#index'
end
