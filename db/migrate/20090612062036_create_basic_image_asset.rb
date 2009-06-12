class CreateBasicImageAsset < ActiveRecord::Migration
  def self.up
    create_table :basic_images do |t|
      t.string :title
      t.string :file_file_name
      t.string :file_content_type
      t.string :file_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :basic_images
  end
end
