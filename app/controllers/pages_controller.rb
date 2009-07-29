class PagesController < ApplicationController
  
  layout 'stockyard'

  before_filter :require_user, :except => ['show', 'missing']

  layout proc{ |c| c.request.xhr? ? :ajax : c.determine_page_layout }
  # layout :determine_page_layout
  protect_from_forgery :except => [:sort]
  
  caches_page :show
  
  # def determine_page_layout
  #   template = @page.template
  #   layout_file = template.file if template
  #   layout_file ||= 'default'
  #   layout_file
  # end
  
  # handles_sorting_of_nested_set
  # layout :determine_page_layout
  
  def sort
    @page = Page.find(params[:page][:id])
    @page.move_to_child_of( params[:page][:parent_id] ) unless params[:page][:parent_id].blank?
    @page.move_to_left_of( params[:page][:left_id] ) unless params[:page][:left_id].blank?
    render :nothing => true
  end

  
  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.find(:all)

    respond_to do |format|
      format.html { render :layout => 'stockyard'}
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    
    @page = Page.find(params[:id]) if params[:id]
    @page ||= Page.find_by_permalink(params[:path].last)
    
    if @page && @page.redirect
      redirect_to @page.redirect_url and return unless @page.redirect_url.blank?
      redirect_to page_path(@page.redirect_page_id) and return unless @page.redirect_page_id.blank?
    end
    
    render :template => 'pages/missing', :status => 404 and return unless @page

    respond_to do |format|
      format.html { render :layout => determine_page_layout }
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save && @page.move_to_child_of(params[:page][:parent_page_id])
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
  
  def rescue_action_in_public(error)
    render :template => 'pages/missing'
  end

  def determine_page_layout
    if request.xhr?
      'ajax'
    elsif @page && @page == Page.root && !@current_user
      'home'
    elsif params[:action] == 'show'
      'default'
    else
      'stockyard'
    end
    
  end
  protected
  

  
  def perform_page_redirection

  end


  

  
  
  
end
