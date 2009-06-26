namespace :stockyard do
  desc "Create Sample Pages, Sections, and Assets NOTE: This will clear your database! "
  task :bootstrap => :environment do

    
    [Page, Section, ContentMapping, TextBlock, BasicImage].each(&:delete_all)
    
    home_page = Page.create(:title => "Home")
    home_page.save
    sitemap = Page.create(:title => "Sitemap" )
    sitemap.parent = home_page
    sitemap.save
    about_us = Page.create(:title => "About Us")
    about_us.parent = home_page
    about_us.save
    products = Page.create(:title => "Products")
    products.parent = home_page
    products.save
    product = Page.create(:title => "Product X")
    product.parent = products
    product.save


    main = Section.create(:title => "Main")
    side = Section.create(:title => "Side")
    
    welcome_text = TextBlock.create(:title => 'Welcome to Stockyard!', "This is generated content that was created when you installed Stockyard. Feel free to edit or remove.")
    ContentMapping.create(:page_id => home_page.id, :section_id => main, :asset_type => 'TextBlock', :asset_id => welcome_text.id)
    
  end
end
