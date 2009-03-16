class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :title
      t.integer :page_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
