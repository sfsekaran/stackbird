Rails.application.routes.draw do
  get '/', to: 'home#index', as: :home
  get '/timeline_redirect', to: 'home#timeline_redirect'
  resources :timeline, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
