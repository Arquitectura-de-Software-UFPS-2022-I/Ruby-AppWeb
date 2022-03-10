Rails.application.routes.draw do
  resources :file_attachments
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  resources :profile
  resources :request do
    get 'request_sign', to: 'request#request_sign'
    post 'request_sign_user', to: 'request#request_sign_user'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
