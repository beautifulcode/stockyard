require 'test_helper'

class PublicBrowsingTest < ActionController::IntegrationTest
  fixtures :all

  context "When visiting the homepage as a public user, " do
    setup do
      visit '/'
    end
    
    should "use the home template" do
      contain "Home Template"
    end
    
    should "have a page div with id and classes from rails" do
      assert have_selector "#page_#{Page.find(1).id}"
      assert have_selector ".page"
    end

    should "see 3 div's with the class section" do
      assert have_selector('div.section', :count => 3)
    end
    
    should "see 5 assets" do
      assert have_selector('div.asset', :count => 5)
    end
    
    should "have text_blocks with proper dom_ids from rails" do
      assert have_selector("div#text_block_#{TextBlock.first.id}")
    end

    should "have text_blocks with proper dom_classes from rails" do
      assert have_selector("div.text_block")
    end

        
    should "see the dynamic text block title" do
      contain "A Text Block"
    end
    
  end
  
  
  
end
