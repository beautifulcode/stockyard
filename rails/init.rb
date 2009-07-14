class ActionController::Routing::RouteSet
  def load_routes_with_clearance!
    lib_path = File.dirname(__FILE__)
    clearance_routes = File.join(lib_path, *%w[.. config stockyard_routes.rb])
    unless configuration_files.include?(clearance_routes)
      add_configuration_file(clearance_routes)
    end
    load_routes_without_clearance!
  end
 
  alias_method_chain :load_routes!, :clearance
end

config.to_prepare do
  ApplicationController.helper(PagesHelper)
  ApplicationController.helper(AssetsHelper)
  ApplicationController.helper(AdminHelper)
end

module Enumerable
  def else(&block)
    self.respond_to?('empty?') && self.empty? ? yield : self
  end
end

