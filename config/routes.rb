Rails.application.routes.draw do
  root 'static_pages#home'

  get '/static_pages/search', to: 'static_pages#search'

  resources :bookmarks
  resources :sites
end
