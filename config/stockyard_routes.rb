ActionController::Routing::Routes.draw do |map|
  
  map.resources :content_mappings, :as => 'content'
  map.resources :pages, 
                        :has_many => :sections, :has_many => :assets, :has_many => :content_mappings, 
                        :collection => {:sort => :put}
  map.resources :page_templates, :has_many => :sections
  map.resources :sections, :has_many => :assets,:has_many => :content_mappings
  map.resources :assets
  
  # Asset Types
  map.resources :text_blocks, :basic_images, :code_snippets

  map.connect '/pages/:page_id/sections/:section_id/content/:action', :controller => 'content_mappings'

  # User Sessions for authlogic
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.stockyard_login '/login', :controller => 'user_sessions', :action => 'new'
  map.stockyard_logout '/logout', :controller => 'user_sessions', :action => 'destroy'

  
  map.root :controller => "pages", :action => "show", :id => 1

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.connect '*path', :controller => 'pages', :action => 'show'
end
