class Page < ActiveRecord::Base
  
  # Rails Associations
  belongs_to :page_template
  has_many :content_mappings
  has_many :sections, :through => :content_mappings, :uniq => true
  # has_many :assets, :through => :content_mappings
  belongs_to :redirect_page, :class_name => 'Page', :foreign_key => :redirect_page_id

  # Plugin Declarations
  acts_as_tree
  acts_as_nested_set
  has_permalink :title
  simply_versioned :keep => 10
  translates :title, :meta_title, :meta_keywords, :meta_description
  accepts_nested_attributes_for :globalize_translations 
  
  # Validations
  validates_presence_of :title
  
  
  def parent_page_id
    parent_id
  end
  
  def parent_page_id=(id)
    parent_page = Page.find(id)
    self.move_to_child_of parent_page unless self.new_record?
    # self.update_attribute(:parent_id, id)
  end
  
  def params
    ''
  end
  
  # Scopes
  named_scope :visible, :conditions => {:visible => true, :active => true}
  named_scope :active, :conditions => {:active => true}
  named_scope :ordered, :order => "position ASC"
  
  def assets
    self.sections.collect{ |section| section.assets  }.flatten || []
  end
  
  def permalink_path
    @ancestor_path = self_and_ancestors.collect{|a| a.permalink }.uniq
    @ancestor_path.shift
    path = "/#{@ancestor_path.join('/')}"
    path = "/#{params[:locale]}#{path}" if params[:locale]
    path
  end
  
  def content_for_section(title)
    section_content = []
    section = Section.find_by_title(title)
    section_content = ContentMapping.find_all_by_page_id_and_section_id(self, section)
    section_content
  end
  
  def assets_for_section(title)
    section_assets = []
    section = Section.find_by_title(title)
    section_assets = ContentMapping.find_all_by_page_id_and_section_id(self, section).collect{|content| content.asset }
    section_assets
  end
  
  def add_content(asset, options = {})
    self.content_mappings << ContentMapping.create(:asset_id => asset.id, :asset_type => asset.class.name, :section_id => 1)
  end
  
end
