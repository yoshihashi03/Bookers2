Rails.application.routes.draw do
  	devise_for :users
  	resources :users, only: [:index, :show, :edit]
	get "users/:id" => "users#show", as: :mypage
	root :to => 'homes#top'
	get 'about' => 'homes#about'
end
