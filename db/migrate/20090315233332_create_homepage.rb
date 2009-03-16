class CreateHomepage < ActiveRecord::Migration
  def self.up
    Page.create(:title => 'Home Page')
  end

  def self.down
    Page.all.destroy
  end
end
