Rails.application.routes.draw do
  root to: 'facts#index'

  get '/search' => 'facts#search'
end
