class AssetsController < ResourceController::Base
  before_filter :require_user, :except => 'show'
  layout :determine_layout
  
  
  def determine_layout(c)
    if c.request.xhr?
        false 
    elsif params[:action] == 'show'
      'default'
    else
      'stockyard'
    end
  end
  
  layout proc{ |c| c.request.xhr? ? false : "stockyard" }
  
  def index
    @asset_class = params[:controller].classify.constantize
    @assets = @asset_class.paginate :all, :per_page => 20, :page => params[:page]
    render :template => 'assets/index'
  end

end
