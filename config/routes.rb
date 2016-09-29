Rails.application.routes.draw do

  devise_for :users

  resources :orders do
  	resources :commodities
  	post 'change_order_address',on: :member
  	get  'index_order_address_for_change',on: :member


	end

	resources :addresses,except:[:edit,:update,:show] do
  	post 'make_it_default', on: :member
	end

	root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
