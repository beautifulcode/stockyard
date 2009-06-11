class CreateAssetVersions < ActiveRecord::Migration
  def self.up
    drop_table :assets
    # Asset.create_versioned_table
  end

  def self.down
    create_table "assets", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
  end
end
