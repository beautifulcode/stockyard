ActionController::Routing::Routes.draw do |map|
  map.resources :code_snippets


  map.resources :content_mappings, :as => 'content'
  map.resources :pages, 
                        :has_many => :sections, :has_many => :assets, :has_many => :content_mappings, 
                        :collection => {:sort => :put}
  map.resources :page_templates, :has_many => :sections
  map.resources :sections, :has_many => :assets,:has_many => :content_mappings
  map.resources :assets
  
  # Asset Types
  map.resources :text_blocks, :basic_images

  map.connect '/pages/:page_id/sections/:section_id/content/:action', :controller => 'content_mappings'
  

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "pages", :action => "show", :id => 1

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.connect '*path', :controller => 'pages', :action => 'show'
end
