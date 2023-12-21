Rails.application.routes.draw do
  resources :patients, only: %w[create show]
  resources :results, only: %w[create show]
end
