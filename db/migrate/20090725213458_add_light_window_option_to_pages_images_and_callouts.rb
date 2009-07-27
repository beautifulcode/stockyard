class AddLightWindowOptionToPagesImagesAndCallouts < ActiveRecord::Migration
  def self.up
    add_column :pages, :lightwindow, :boolean
    add_column :basic_images, :lightwindow, :boolean
  end

  def self.down
    remove_column :basic_images, :lightwindow
    remove_column :pages, :lightwindow
  end
end
