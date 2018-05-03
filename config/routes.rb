Rails.application.routes.draw do
  root 'static_pages#home'

  get '/bookmarks/search', to: 'bookmarks#search'

  resources :bookmarks
  resources :sites
end
