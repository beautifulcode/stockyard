require 'test_helper'

class TextBlockTest < ActiveSupport::TestCase
  should_have_many :pages
  should_have_many :sections
end
