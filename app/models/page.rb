class Page < ActiveRecord::Base
  
  # Rails Associations
  belongs_to :page_template
  has_many :content_mappings
  has_many :sections, :through => :content_mappings, :uniq => true
  # has_many :assets, :through => :content_mappings

  # Plugin Declarations
  acts_as_tree
  acts_as_nested_set
  has_permalink :title
  
  # Validations
  validates_presence_of :title
  
  def assets
    self.sections.collect{ |section| section.assets  }.flatten || []
  end
  
end
