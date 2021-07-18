Rails.application.routes.draw do

  devise_for :users, path: :gurus, 
                     path_name: { sign_in: :login, sign_out: :logout }, 
                     controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'sessions/new'
  get 'users/new'

  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: %i[create]
    get :result, on: :member
  end

  namespace :admin do
    resources :tests, only: %i[index new create show] do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: %i[index]
  end
end
