class AddAssetTemplateToContent < ActiveRecord::Migration
  def self.up
    add_column :content_mappings, :asset_template, :string
  end

  def self.down
    remove_column :content_mappings, :asset_template
  end
end
