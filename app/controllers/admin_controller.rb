require 'fastercsv'
class AdminController < ApplicationController
  
  before_filter :require_user
  
  layout 'stockyard'
  
  def clear_cache
    
  end
  
  
  
  def import
    count = 0
    csv_file = params[:file]
    csv_file = '/Users/aaron/projects/medical_marijuana/support/medical-site-structure-03.csv' unless params[:file]
    @message = ''
    # Page.create(:title => )
    count = 0
    FasterCSV.foreach(csv_file, :row_sep => "\r") do |row|
        # MS-DOS CSV
        old_url, old_page_name, page_name, page_id, new_url, keyword_mapping, meta_title, meta_description = row 
        # Old URL Old Page Name Page Name Page ID New URL Keyword Mapping   301 Redirect  Title Meta

        if count > 0 && !new_url.blank?
          page = Page.find_or_create_by_title(page_name)
          
          page.permalink = new_url
          page.meta_keywords = keyword_mapping
          # page.meta_title = meta_title
          page.meta_description = meta_description

          if @previous_page
            if page.title && page.title.include?(' - ')
              
              @parent = Page.find_or_create_by_title(page.title.split(' - ').first)
              page.title = page.title.delete @parent.title
              @parent.add_child(page)
            else
              page.parent = Page.root
            end
            
          end
          
          default_content = ContentMapping.create(:page_id => page.id, :asset_type => 'TextBlock', :asset_id => TextBlock.create(:title => page.title, :content => 'Lorem ipsum').id, :section_id => 1)
      
          page.save
          @previous_page = page
          @message << "Imported: #{@previous_page.title}"
        end
        count += 1
        
    end
    Page.root.renumber_full_tree
    render :text => @message
  end
  
end
