# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin?
    true
  end
  
  def site_nav
    if @page
      html = '<ul>'
      @page.children.each do |page|
        html << "<li>#{link_to page.title, page_path(page.id)}"
        html << nav_for(page) if page.children
        html << "</li>"
      end
      html << '</ul>'
    else
      
    end
  end
  
  def nav_for(page)
    html = '<ul>'
    page.children.each do |page|
      html << "<li>#{link_to page.title, page_path(page.id)}</li>"
    end
    html << '</ul>'
  end
  
  
end
