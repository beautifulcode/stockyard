ActionController::Routing::Routes.draw do |map|
  
  map.resources :content_mappings, :as => 'content', :collection => {:sort => :put}
  map.resources :assets
  map.resources :pages, :collection => {:sort => :put} do |page|
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
  
  # Asset Types
  map.resources :text_blocks, :basic_images, :code_snippets

  map.connect '/pages/:page_id/sections/:section_id/content/:action', :controller => 'content_mappings'

  # User Sessions for authlogic
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.stockyard_login '/login', :controller => 'user_sessions', :action => 'new'
  map.stockyard_logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.forgotten_password '/forgot_password', :controller => 'password_resets', :action => 'new'
  
  map.root :controller => "pages", :action => "show", :id => 1

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.connect '*path', :controller => 'pages', :action => 'show'
end
