HackerNews::Application.routes.draw do
  resources :users
  resources :links

  root :to => 'links#index'
end
