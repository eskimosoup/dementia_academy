DementiaAcademy::Application.routes.draw do
	
	mount Manticore::Engine => "/admin"
	
	resources :events
	resources :pages
	resources :partners
	
  namespace :admin do
		chronicler_resources :events
    chronicler_resources :pages do
      member do
        get 'set_home_page'
        get 'set_contact_page'
      end
    end
    chronicler_resources :partners
  end
	
  match 'accessibility' => "application#accessibility", :as => 'accessibility'
  match 'contact'       => "application#contact", :as => 'contact', :via => [:get, :post]
  match 'site_map'      => "application#site_map", :as => 'site_map'
  match 'thank_you'     => "application#thank_you", :as => 'thank_you'
	
  root :to => 'application#index'
  
end
