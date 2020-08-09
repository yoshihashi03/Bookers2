Rails.application.routes.draw do
  	devise_for :users
    resources :users,only: [:show,:edit,:update,:index] do
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follower', as: 'follows'
      get 'followers' => 'relationships#followed', as: 'followers'
    end
  	resources :books, only: [:index, :show, :edit, :update, :create, :destroy] do
  		resource :favorites, only: [:create, :destroy]
  		resource :book_comments, only: [:create, :destroy]
  	end
	root to: 'homes#top'
	get 'home/about', to: 'homes#about'
  get 'search/search', to: 'search#search'
  # get 'relationship/followed', to: 'relationships#followed'
  # get 'relationship/follower', to: 'relationships#follower'

	# post 'follow/:id', to: 'relationships#follow', as: 'follow'
	# post 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
end
