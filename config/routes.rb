Rails.application.routes.draw do
  resources :tests, only: %i[index] do
    resources :questions
  end
end
