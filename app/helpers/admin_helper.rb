module AdminHelper
  def admin?
    @current_user
  end
  
  def logged_in?
    @current_user
  end
  
  def flash_messaging
    html = ''
    flash.each do |key, value|
      html << "<div class='flash #{key}'>#{value}<span id='flash-left'></span><span id='flash-right'></span></div>"
    end
    html
  end
  
  def asset_edit_link_for(asset)
    link_to "Edit #{asset.class.name}", edit_polymorphic_path(asset) if @current_user
  end
end
