class PageTemplatesController < ApplicationController
  before_filter :require_user
  # GET /page_templates
  # GET /page_templates.xml
  def index
    @page_templates = PageTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page_templates }
    end
  end

  # GET /page_templates/1
  # GET /page_templates/1.xml
  def show
    @page_template = PageTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page_template }
    end
  end

  # GET /page_templates/new
  # GET /page_templates/new.xml
  def new
    @page_template = PageTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page_template }
    end
  end

  # GET /page_templates/1/edit
  def edit
    @page_template = PageTemplate.find(params[:id])
  end

  # POST /page_templates
  # POST /page_templates.xml
  def create
    @page_template = PageTemplate.new(params[:page_template])

    respond_to do |format|
      if @page_template.save
        flash[:notice] = 'PageTemplate was successfully created.'
        format.html { redirect_to(@page_template) }
        format.xml  { render :xml => @page_template, :status => :created, :location => @page_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /page_templates/1
  # PUT /page_templates/1.xml
  def update
    @page_template = PageTemplate.find(params[:id])

    respond_to do |format|
      if @page_template.update_attributes(params[:page_template])
        flash[:notice] = 'PageTemplate was successfully updated.'
        format.html { redirect_to(@page_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /page_templates/1
  # DELETE /page_templates/1.xml
  def destroy
    @page_template = PageTemplate.find(params[:id])
    @page_template.destroy

    respond_to do |format|
      format.html { redirect_to(page_templates_url) }
      format.xml  { head :ok }
    end
  end
end
