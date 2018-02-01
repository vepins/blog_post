Rails.application.routes.draw do

  resources :blog_posts
      # resources is REPLACING the get routes before
      # get 'blog_posts/index'
      #
      # get 'blog_posts/show'
      #
      # get 'blog_posts/edit'
      #
      # get 'blog_posts/new'
  resources :comments, only: [:edit, :create, :destroy, :update]

  root 'blog_posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
