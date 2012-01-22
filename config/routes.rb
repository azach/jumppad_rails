JumppadRails::Application.routes.draw do
  resources :trips

	root :to => "home#index"
end
