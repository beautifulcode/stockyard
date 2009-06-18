require 'fastercsv'
class AdminController < ApplicationController
  layout 'stockyard'
  def import
    count = 0
    csv_file = params[:file]
    csv_file = '/Users/aaron/projects/mm/support/medical-site-structure-01.csv' unless params[:file]
    @message = ''
    # Page.create(:title => )
    count = 0
    FasterCSV.foreach(csv_file, :row_sep => "\r") do |row|
        # MS-DOS CSV
        old_url, old_page_name, page_name, page_id, new_url, keyword_mapping, redirect, meta_title, meta_description = row 
        # Old URL Old Page Name Page Name Page ID New URL Keyword Mapping   301 Redirect  Title Meta

        if count > 0
          page = Page.find_or_create_by_title(page_name) unless new_url.blank?
          page.permalink = new_url

          # page.keywords = keyword_mapping
          # page.meta_title = meta_title
          # page.meta_description = meta_description

          if @previous_page
            if page.title && page.title.include?(' - ')
              
              @parent = Page.find_or_create_by_title(page.title.split(' - ').first)
              @parent.add_child(page)
            else
              page.parent = Page.root
            end
            
          end
      
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
