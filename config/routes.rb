Rails.application.routes.draw do
  	devise_for :users
  	resources :users, only: [:index, :show, :edit, :update]
  	resources :books, only: [:index, :show, :edit, :update, :create, :destroy] do
  		resource :favorites, only: [:create, :destroy]
  		resources :book_comments, only: [:create, :destroy]
  	end
	root :to => 'homes#top'
	get 'home/about' => 'homes#about'

	post 'follow/:id' => 'relationships#follow', as: 'follow'
	post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end
