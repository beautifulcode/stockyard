module PagesHelper
  def page_keywords
    if @page
      @page.meta_keywords
    else
      ''
    end
  end
  
  def page_meta_description
    if @page
      @page.meta_description
    else
      ''
    end
  end
  
  def page_meta_title
    if @meta_title
      @meta_title
    elsif @page
      @page.meta_title
    else
      ''
    end
  end
  
  def page_css_class
    if @page
      @page.css_class
    else
      ''
    end
  end
  def site_nav
    if @page
      html = '<ul>'

      Page.root.children.visible.each do |page|
        html << "<li>#{link_to page.title, page.permalink_path, :class => page.nav_item_css_class, :params => page.nav_item_parameters}"
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
      html << "<li class='#{active_class(page)}'>"
      html << link_to( "<span>#{page.title}</span>", page.permalink_path, :class => page.nav_item_css_class, :params => page.nav_item_parameters, :id => "page_#{page.id}") if page.visible
      html << "</li>"
    end
    html << '</ul>'
  end
  
  def sibling_nav
    html = '<ul>'
    @page.self_and_siblings.each do |page|
      html << "<li class='#{active_class(page)}'>"
      html << link_to( "#{page.title}", page.permalink_path, :class => page.nav_item_css_class, :params => page.nav_item_parameters) if page.visible
      html << "</li>"
    end
    html << '</ul>'
  end
  
  def active_class(page)
    # 'active' if page == @page || page.ancestors.include?( @page)
    'active' if request.request_uri.include? page.permalink_path
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
      html << "<li id='page_1' class=''>#{link_to root_page.title, page_path(root_page)}"
      html << "<span class='handle'></span>"
      html << link_to( root_page.title, root_page.permalink_path, :class => "title #{'folder' if root_page.children.size > 0 }")
      html << ' <p>'
      html << link_to( 'Edit', edit_page_path(root_page.id), :class => 'edit')
      html << ' | '
      html << link_to( 'Delete', page_path(root_page.id), :class => 'destroy', :method => 'delete', :confirm => 'Are you sure?')
      html << '</p>'

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
      html << "</li>"
      html << '</ul>'
      html << '</div>'
      # html << '<script type="text/javascript">  var page_tree = Sortable.create("page_tree", {tree:true,scroll:window});</script>'
      
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
