Rails.application.routes.draw do
  resources :file_attachments
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users
  resources :profile
  resources :request do
    get 'request_sign', to: 'request#request_sign'
    post 'request_sign_user', to: 'request#request_sign_user'
    get 'download_document', to: 'request#download_document'
  end
  resources :sign_user do
    post 'sign_user', to: 'sign_user#sign_user_document'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
