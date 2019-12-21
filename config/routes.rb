Rails.application.routes.draw do
 root :to => 'home#index'

get 'home/about', to: 'home#new'


devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}

	
	resources :users
	


	resources :books
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
