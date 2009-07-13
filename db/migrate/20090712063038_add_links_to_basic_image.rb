class AddLinksToBasicImage < ActiveRecord::Migration
  def self.up
    add_column :basic_images, :page_id, :integer
    add_column :basic_images, :link, :string
    add_column :basic_images, :caption, :string
  end

  def self.down
    remove_column :basic_images, :caption
    remove_column :basic_images, :link
    remove_column :basic_images, :page_id
  end
end
