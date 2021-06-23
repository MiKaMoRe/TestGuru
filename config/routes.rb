Rails.application.routes.draw do
  resources :tests, only: %i[] do
    resources :questions, shallow: true, except: %i[update]
  end
end
