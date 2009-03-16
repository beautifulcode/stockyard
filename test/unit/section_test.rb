require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  should_have_many :content_mappings
  # should_belong_to :page_template
  # should_have_many :assets, :through => :content_mappings
  

  
end
