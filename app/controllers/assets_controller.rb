class AssetsController < ResourceController::Base
  before_filter :require_user, :only => ['new', 'create', 'edit', 'update', 'destroy']
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
    respond_to do |wants|
      wants.html do
        if File.exists? "#{RAILS_ROOT}/#{@asset_class.tableize}/index"
          render :template => "#{@asset_class.tableize}/index"
        else
          render :template => 'assets/index'
        end
      end
      wants.xml { render :template => "#{@asset_class.tableize}/index" }
    end
    
  end
  
  def upload
    begin
      @asset_class = params[:controller].classify.constantize
      @asset_instance = @asset_class.find(params[:id])
      render :text => @asset_instance.upload_permalink
    rescue
      render :text => '/images/missing.png'
    end
  end

end
