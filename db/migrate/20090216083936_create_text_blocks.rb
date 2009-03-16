class CreateTextBlocks < ActiveRecord::Migration
  def self.up
    create_table :text_blocks do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :text_blocks
  end
end
