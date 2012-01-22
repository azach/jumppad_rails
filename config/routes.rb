JumppadRails::Application.routes.draw do
  resources :trips

	root :to => "home#index"
	
	resources :trip
end
