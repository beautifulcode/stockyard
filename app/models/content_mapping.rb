class ContentMapping < ActiveRecord::Base
  belongs_to :section
  belongs_to :page
  belongs_to :asset, :polymorphic => true
  accepts_nested_attributes_for :asset
  default_scope :order => 'position ASC'
  
  def partial
    asset
  end
  
  
end
