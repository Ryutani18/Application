Rails.application.routes.draw do
  root to: 'home#top'
  get 'searchs/search'
  
  get 'tags' => 'tags#index'
  get 'tags/:tag_name' => 'tags#show'

  get 'search' => 'searchs#search'
  post 'search/index' => 'searchs#index'

  resources :users, except: [:new] do
    resource :relationship, only: [:create, :destroy]
  end
  get 'signup' => 'users#new'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'
  
  resources :posts do
    resource :like, only: [:create, :destroy]
  end
  post 'posts/:id/comment' => 'posts#comment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
