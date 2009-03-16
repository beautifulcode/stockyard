class Section < ActiveRecord::Base
  # belongs_to :page
  belongs_to :page_template
  has_many :content_mappings
  
  # has_many :assets, :through => :content_mappings
  
  
  def assets
    self.content_mappings.collect{|mapping| mapping.asset }
  end  
  
end
