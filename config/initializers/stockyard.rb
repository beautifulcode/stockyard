
# ALLOWS THIS SYNTAX IN ERB
# <% results.each do |x| %>
#   <li>hit:<%=x-%></li>
# <% end.else do %>
#   <li>no hits found</li>
# <% end %>


module Enumerable
  def else(&block)
    self.respond_to?('empty?') && self.empty? ? yield : self
  end
end


# class ActionController::Base
#   
#   def default_template_name(action_name = self.action_name, klass = self.class) 
#     if action_name && klass == self.class  
#       action_name = action_name.to_s 
#       if action_name.include?('/') && template_path_includes_controller?(action_name) 
#         action_name = strip_out_controller(action_name) 
#       end 
#     end 
# 
#      
#     if !klass.superclass.method_defined?(:controller_path) 
#       return "#{self.controller_path}/#{action_name}" 
#     end 
#      
#     template_name = "#{klass.controller_path}/#{action_name}" 
#   
#     if template_exists?(template_name) 
#       return template_name 
#     else 
#       return default_template_name(action_name, klass.superclass) 
#     end 
#     
#   end
# end
