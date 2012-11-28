PatsMdb::Application.routes.draw do
  
  # generated routes
  resources :pets
  resources :owners
  resources :visits
  
  # semi-static page routes
  match 'home' => 'home#index', :as => :home
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'home#contact', :as => :contact
  match 'privacy' => 'home#privacy', :as => :privacy
  
  # set the root url
  root :to => 'home#index'
end
