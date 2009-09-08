class ContentMapping < ActiveRecord::Base
  belongs_to :section
  belongs_to :page
  belongs_to :asset, :polymorphic => true
  acts_as_list :scope => :section
  
  accepts_nested_attributes_for :asset
  
  default_scope :order => 'position ASC'
  
  attr_accessor :asset_type_selector
  
  def asset_type
    asset.class.name
  end
  
  def partial
    template = asset_template unless asset_template.blank?
    template ||= asset 
    template
  end
  
  
end
