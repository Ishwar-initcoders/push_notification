Rails.application.routes.draw do
  root 'page#index'

  post "/subscribe" => "subscriptions#create"
  delete "/unsubscribe" => "subscriptions#destroy"
  post "/push" => "push_notifications#create"

  get "/*path/offline" => "welcome#offline"

  get "/*id" => "pages#show", as: :page, format: false, constraints: { id: /(?!assets).*/ }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
