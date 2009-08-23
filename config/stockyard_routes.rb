ActionController::Routing::Routes.draw do |map|
  
  # CONTENT MAPPINGS = PAGES -> SECTIONS -> ASSETS
  map.resources :content_mappings, :as => 'content', :collection => {:sort => :put}
  map.resources :assets

  map.resources :pages do |page|
    page.resource :assets
    page.resources :sections do |page_section|
      page_section.resources :content_mappings
    end
  end

  map.resources :sections do |section|
    section.resources :assets
    section.resources :content_mappings, :collection => {:sort => :put}
  end
  map.resources :page_templates, :has_many => :sections
  
  # BASE ASSET TYPES
  map.resources :text_blocks, :basic_images, :code_snippets, :callouts
  map.connect '/pages/:page_id/sections/:section_id/content/:action', :controller => 'content_mappings'

  # USER LOGIN - Authlogic
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  map.stockyard_login '/login', :controller => 'user_sessions', :action => 'new'
  map.stockyard_logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.forgotten_password '/forgot_password', :controller => 'password_resets', :action => 'new'
  
  # ADMIN PATHS
  map.connect '/admin/:controller/:action/:id', :layout => 'stockyard'
  map.connect '/admin/:controller/:action/:id.:format', :layout => 'stockyard'
  
  # HOMEPAGE
  map.root :controller => "pages", :action => "show", :id => Page.root.id if Page

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  # CATCHALL ROUTE - For Pages. Provides path array via params
  map.connect '*path', :controller => 'pages', :action => 'show'
end
