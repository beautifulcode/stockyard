class AddPositionToContentMapping < ActiveRecord::Migration
  def self.up
    add_column :content_mappings, :position, :integer
  end

  def self.down
    remove_column :content_mappings, :position
  end
end
