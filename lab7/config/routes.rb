Rails.application.routes.draw do
  root "luggages#index"
  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"
  #resources :articles
  resources :luggages
  get "/task_a", to: "luggages#task_a"
  get "/task_b", to: "luggages#task_b"
  get "/task_c", to: "luggages#task_c"
  get "/task_d", to: "luggages#task_d"
  get "/task_e", to: "luggages#task_e"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
