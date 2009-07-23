ActionController::Routing::Routes.draw do |map|

  map.resources :companies do |companies|
    companies.resources :contacts
  end

  map.root :controller => "site"

  map.search '/search', :controller => :search, :action => 'search'

end
