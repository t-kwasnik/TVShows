TvShows::Application.routes.draw do
  resources :television_shows, only: :index
end
