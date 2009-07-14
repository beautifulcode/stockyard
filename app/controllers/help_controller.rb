class HelpController < ApplicationController
  layout :which_layout
  
  def which_layout
    if @current_user
      'stockyard' 
    else
      'user_sessions'
    end
  end
  
  def index
  end

  def faq
  end

  def pages
  end

  def markdown
  end

end
