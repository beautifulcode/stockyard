require 'test_helper'

class ContentMappingTest < ActiveSupport::TestCase

  should_belong_to :section
  should_belong_to :page
  should_belong_to :asset

end
