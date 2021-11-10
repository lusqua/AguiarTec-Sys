Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :clientes do
        resources :computers
      end
      resources :computers
    end
  end

  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :contacts
  #     end
  #   end
  # end
end
