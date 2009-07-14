class ContentMapping < ActiveRecord::Base
  belongs_to :section
  belongs_to :page
  belongs_to :asset, :polymorphic => true
  accepts_nested_attributes_for :asset
  default_scope :order => 'position ASC'
  attr_accessor :asset_type_selector
  
  def partial
    asset
  end
  
  
end
