Rails.application.routes.draw do
  get '/', to: 'home#index'

  get '/timeline/:handle', to: 'timeline#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
