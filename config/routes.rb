Rails.application.routes.draw do
  	devise_for :users
  	resources :users, only: [:index, :show, :edit, :update]
  	resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
	root :to => 'homes#top'
	get 'home/about' => 'homes#about'
end
