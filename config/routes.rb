Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    devise_for :users
    devise_for :hosts

    root 'pages#home'

    resources :users

    namespace :platform do #from slides
      get '/home', to: 'pages#host_homepage'
      resources :dashboards, only: [:show]
      resources :hosts #points to edit_platform_host_path _platform.html.erb
    end
end
