
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