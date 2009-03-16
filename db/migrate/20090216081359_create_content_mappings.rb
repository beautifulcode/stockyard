class CreateContentMappings < ActiveRecord::Migration
  def self.up
    create_table :content_mappings do |t|
      t.integer :page_id
      t.integer :section_id
      t.string :asset_type
      t.integer :asset_id

      t.timestamps
    end
  end

  def self.down
    drop_table :content_mappings
  end
end
