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
  simply_versioned :keep => 10
  
  
  # Validations
  validates_presence_of :title
  
  
  # Scopes
  named_scope :visible, :conditions => {:visible => true}
  
  def assets
    self.sections.collect{ |section| section.assets  }.flatten || []
  end
  
  def permalink_path
    ancestor_path = self_and_ancestors.collect{|a| a.permalink }
    ancestor_path.shift
    ancestor_path.join('/')
  end
  
  def assets_for_section(title)
    assets = []
    section = Section.find_by_title(title)
    # assets = ContentMapping.find_all_by_page_id_and_section_id(@page, section) if section
    assets = assets.select{|asset| asset.section == section} if section
    assets
  end
  
end
