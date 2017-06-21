Rails.application.routes.draw do
	mount ActionCable.server => '/cable'
	
	post "chatrooms/join/:id", to: "chatrooms#join", as: 'join_chatroom'
	
  devise_for :users
	resources :chatrooms , only: [:new, :create, :show, :index, :join]

	root :to => "chatrooms#index"

	# match ':controller(/:action(/:id(.:format)))', :via => :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
