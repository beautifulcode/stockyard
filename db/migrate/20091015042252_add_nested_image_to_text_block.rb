class AddNestedImageToTextBlock < ActiveRecord::Migration
  def self.up
    add_column :text_blocks, :nested_image_id, :integer
    add_column :text_blocks, :nested_image_alignment, :string
    add_column :text_blocks, :nested_image_class, :string
  end

  def self.down
    remove_column :text_blocks, :nested_image_class
    remove_column :text_blocks, :nested_image_alignment
    remove_column :text_blocks, :nested_image_id
  end
end
