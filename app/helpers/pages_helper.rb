module PagesHelper
  
  def site_nav
    if @page
      html = '<ul>'
      @page.root.children.visible.each do |page|
        html << "<li>#{link_to page.title, page.permalink_path}"
        html << nav_for(page) if page.children
        html << "</li>"
      end
      html << '</ul>'
    else
      
    end
  end
  
  def nav_for(page)
    html = '<ul>'
    page.children.visible.each do |page|
      html << "<li>"
      html << link_to( "#{page.title}", page.permalink_path) if page.visible
      html << "</li>"
    end
    html << '</ul>'
  end
  
  def sibling_nav
    html = '<ul>'
    @page.self_and_siblings.each do |page|
      html << "<li>"
      html << link_to( "#{page.title}", page.permalink_path) if page.visible
      html << "</li>"
    end
    html << '</ul>'
  end
  
  
  
  def admin_page_tree_for(page, level)
    html = '<ul>'
    last_page = page.children.last
    
    page.children.each do |page|
      html << "<li id='page_#{page.id}' class='level_#{level}'>"
      html << "<span class='handle'></span>" if page.children.size > 0
      html << link_to( page.title, page.permalink_path, :class => "title #{'folder' if page.children.size > 0 }")
      html << ' <p>'
      html << link_to( 'Edit', edit_page_path(page.id), :class => 'edit')
      html << ' | '
      html << link_to( 'Delete', page_path(page.id), :class => 'destroy', :method => 'delete', :confirm => 'Are you sure?')
      html << '</p>'
      html << admin_page_tree_for(page, level)
      html << "</li>"
      # html << "<li>#{link_to 'New Page', new_page_path}</li>"
    end
    html << '</ul>'
  end
  
  def admin_page_tree
    root_page = Page.root
    if root_page
      html = '<div>'
      html << '<ul id="tree">'
      level = 1
      html << "<li id='page_1' class=''>#{link_to root_page.title, page_path(root_page)}</li>"
      root_page.children.each do |page|
        html << "<li id='page_#{page.id}' class=''>"
        html << "<span class='handle'></span>"
        html << link_to( page.title, page.permalink_path, :class => "title #{'folder' if page.children.size > 0 }")
        html << ' <p>'
        html << link_to( 'Edit', edit_page_path(page.id), :class => 'edit')
        html << ' | '
        html << link_to( 'Delete', page_path(page.id), :class => 'destroy', :method => 'delete', :confirm => 'Are you sure?')
        html << '</p>'
        html << ' '
        html << admin_page_tree_for(page, level) if page.children
        html << "</li>"
      end
      html << '</ul>'
      html << '</div>'
      html << '<script type="text/javascript">  var page_tree = Sortable.create("page_tree", {tree:true,scroll:window});</script>'
      
    else
      
    end
  end
  
  # def assets_for(section)
  #   html = ''
  #   section.assets.each do |asset|
  #     html << render :partial => asset
  #   html
  # end
  
  
end
