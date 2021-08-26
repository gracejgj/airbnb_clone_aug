Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    devise_for :users
    devise_for :hosts

    root 'pages#home'

    resources :users
    resources :listings, only: [:show] #use show to user they're not admin

    namespace :platform do #from slides (for host/admin)
      get '/home', to: 'pages#host_homepage'

      resources :dashboards, only: [:show]
      resources :hosts #points to edit_platform_host_path _platform.html.erb
      resources :listings do
        member do #add member here to get the listing id
          delete :delete_photo_attachment #action method name insid elisting controller
        end
      end
    end
end
