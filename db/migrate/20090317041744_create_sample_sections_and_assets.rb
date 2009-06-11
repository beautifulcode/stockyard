class CreateSampleSectionsAndAssets < ActiveRecord::Migration
  def self.up
    home = Page.find(1)
    main = Section.create(:title => 'Main')
    side = Section.create(:title => 'Side')
    
    text = TextBlock.create(:title => 'Sample Block')
    text2 = TextBlock.create(:title => 'Sample Block 2')
    
    # ContentMapping.create(:page_id => home.id, :section_id => main.id, :asset_type => text.class.name, )
    content = ContentMapping.new
    content.page = home
    content.section = main
    content.asset = text
    content.save
    
    content = ContentMapping.new
    content.page = home
    content.section = main
    content.asset = text2
    content.save
    
  end

  def self.down
    Section.all.destroy
    TextBlock.all.destroy
    ContentMapping.all.destroy
  end
end
