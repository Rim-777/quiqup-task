Rails.application.routes.draw do

  get "/requests/fetch_data", to: "requests#fetch_data"
  root 'requests#index'
end
