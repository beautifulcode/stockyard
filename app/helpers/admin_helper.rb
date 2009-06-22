module AdminHelper
  def admin?
    # true
    false
  end
  
  def logged_in?
    # true
    false
  end
  
  def flash_messaging
    html = ''
    flash.each do |key, value|
      html << "<div class='flash #{key}'>#{value}<span id='flash-left'></span><span id='flash-right'></span></div>"
    end
    html
  end
end
