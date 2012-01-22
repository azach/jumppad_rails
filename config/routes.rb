JumppadRails::Application.routes.draw do
  resources :trips do
  	resources :segments
  end

	root :to => "home#index"
end
