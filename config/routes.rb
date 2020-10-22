Rails.application.routes.draw do
  root 'post_images#index'
  # deviseを使用する際、URLとしてusersを含むことを示す。
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # resource単数にすると、そのコントローラのidがリクエストに含まれなくなる
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
