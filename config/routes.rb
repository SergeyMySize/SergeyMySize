Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'user_profile#index'
  get 'products', to: 'product#index'
  post 'user_profile', to: 'user_profile#update_user_results'
  get 'thank_you', to: 'user_profile#thank_you'

end
