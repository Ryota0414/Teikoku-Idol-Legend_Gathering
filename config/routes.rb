Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
scope module: :public do
  root :to =>"homes#top"
  get 'homes/about'
  resources :users, only:[:show, :edit, :update, :destroy]
  resources :posts, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only:[:create, :edit, :update, :destroy]
  end
end
  devise_scope :user do
  get '/users/sign_out', to: 'public/sessions#destroy'
  post "users/guest_sign_in", to: "guest_users/sessions#guest_sign_in"
end
  
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get '/' => 'homes#top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
