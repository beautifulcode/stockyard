class Asset < ActiveRecord::Base
  self.abstract_class = true
  has_many :content_mappings
  has_many :pages, :through => :content_mappings
  has_many :sections, :through => :content_mappings
  simply_versioned :keep => 10
  
#   NOT WORKING
  # def Asset.children
  #   @children ||= []
  # end
  # 
  # def self.inherited(subclass)
  #   super
  # ensure
  #   children << subclass.new()
  #   children.last.run()
  # end
  # 
  # def run
  #   # Do something when child is instantiate
  # end
  
  
end
