Rails.application.routes.draw do
  root to: 'facts#index'

  get '/search' => 'facts#search'
  get '/random' => 'facts#random'
end


