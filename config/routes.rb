Rails.application.routes.draw do
  resources :tests, only: %i[index show] do
    resources :questions, shallow: true, except: %i[index]
  end
end
