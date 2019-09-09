Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :update]
    resource :session, only: [:create, :destroy]
  end

  root "static_page#root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
