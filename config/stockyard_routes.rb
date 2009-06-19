ActionController::Routing::Routes.draw do |map|

  map.resources :content_mappings, :as => 'content'
  map.resources :pages, 
                        :has_many => :assets, :has_many => :content_mappings, :has_many => :sections, 
                        :collection => {:sort => :put}
  map.resources :page_templates, :has_many => :sections
  map.resources :sections, :has_many => :assets
  map.resources :assets
  
  # Asset Types
  map.resources :text_blocks, :basic_images

  

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
