class ContentMappingsController < ApplicationController
  
  layout 'stockyard'
  before_filter :require_user
  before_filter :determine_asset
  
  
  def sort
    @section = Section.find(params[:section_id])
    @section.content_mappings.each do | c |
      c.position = params["section-content-list-#{@section.id}"].index(c.id.to_s)+1
      c.save
    end
    render :nothing => true
  end
  
  def determine_asset
    
    asset_class = eval(params[:asset_type].classify) if params[:asset_type] 
    mapping = ContentMapping.find(params[:id]) if params[:id]
    asset_class ||= mapping.asset.class if mapping && mapping.asset
    
    @asset_class = asset_class


  end
  # GET /content_mappings
  # GET /content_mappings.xml
  def index
    @content_mappings = ContentMapping.find(:all, :order => 'page_id ASC, section_id ASC')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_mappings }
    end
  end

  # GET /content_mappings/1
  # GET /content_mappings/1.xml
  def show
    @content_mapping = ContentMapping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_mapping }
    end
  end

  # GET /content_mappings/new
  # GET /content_mappings/new.xml
  def new
    @content_mapping = ContentMapping.new
    @content_mapping.section = Section.find(params[:section_id]) if params[:section_id]
    @content_mapping.page = Page.find(params[:page_id]) if params[:page_id]
    @content_mapping.asset_type = params[:asset_type].classify if params[:asset_type]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_mapping }
    end
  end

  # GET /content_mappings/1/edit
  def edit
    @content_mapping = ContentMapping.find(params[:id])
  end

  # POST /content_mappings
  # POST /content_mappings.xml
  def create
    @content_mapping = ContentMapping.new(params[:content_mapping])

    respond_to do |format|
      if @content_mapping.save
        flash[:notice] = 'ContentMapping was successfully created.'
        format.html { redirect_to(@content_mapping) }
        format.xml  { render :xml => @content_mapping, :status => :created, :location => @content_mapping }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_mappings/1
  # PUT /content_mappings/1.xml
  def update
    @content_mapping = ContentMapping.find(params[:id])

    respond_to do |format|
      if @content_mapping.update_attributes(params[:content_mapping])
        flash[:notice] = 'ContentMapping was successfully updated.'
        format.html { redirect_to(@content_mapping) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_mappings/1
  # DELETE /content_mappings/1.xml
  def destroy
    @content_mapping = ContentMapping.find(params[:id])
    @content_mapping.destroy

    respond_to do |format|
      format.html { redirect_to(content_mappings_url) }
      format.xml  { head :ok }
    end
  end
end
