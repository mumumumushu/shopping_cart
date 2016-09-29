Rails.application.routes.draw do

  devise_for :users

  resources :orders do
  	resources :commodities
	end

	resources :addresses do
  	post 'make_it_default', on: :member
	end

	root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
