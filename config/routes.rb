Rails.application.routes.draw do
  root "games#new"
  resources :games, only: %i[new create] do
    member do
      get :give_up
      get :challenge
    end
    resource :progresses, only: %i[new create]
  end
end
