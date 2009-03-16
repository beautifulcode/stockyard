require 'test_helper'

class PageTest < ActiveSupport::TestCase

  should_have_many :sections
  should_belong_to :page_template
  # should_have_many :assets
  
  should_have_instance_methods :assets
  
  # should_validate_presence_of(:title)
  
  should "have children pages" do
    @page = pages(:home)
    # assert @page.root?
    assert @page.children
    assert @page.children.size, 2
    assert @page.direct_children
    assert @page.direct_children.size, 1
    # assert @page.all_children
  end
  
  
  should "validate presence of title" do
    @page = Page.new()
    assert !@page.valid?
    assert @page.errors.on(:title)
    @page.title = "Hello There"
    assert @page.valid?
  end

  
  should "have a permalink" do
    @page = Page.create(:title => 'My Page')
    assert_equal @page.permalink, 'my-page'
  end
  
  should "have 2 sections attached to homepage" do
    assert_not_nil pages(:home).sections
    assert_equal pages(:home).sections.size, 2
  end
  
  should "have 4 assets attached to homepage" do
    assert_not_nil pages(:home).assets
    assert_equal pages(:home).assets.size, 5
    assert_equal pages(:home).assets.first.class.name, 'TextBlock'
  end
  
end
