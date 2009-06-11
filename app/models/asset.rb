class Asset < ActiveRecord::Base
  self.abstract_class = true
  has_many :content_mappings
  has_many :pages, :through => :content_mappings
  has_many :sections, :through => :content_mappings
  simply_versioned :keep => 10
  
  
end
