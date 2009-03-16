class AddPageTemplateToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :page_template_id, :integer
  end

  def self.down
    remove_column :pages, :page_template_id
  end
end
