class AddMetaInfoAndVisibleActiveFlags < ActiveRecord::Migration
  def self.up
    add_column :pages, :visible, :boolean, :default => true
    add_column :pages, :active, :boolean, :default => true
    add_column :pages, :meta_keywords, :text
    add_column :pages, :meta_description, :text
  end

  def self.down
    remove_column :pages, :meta_description
    remove_column :pages, :meta_keywords
    remove_column :pages, :active
    remove_column :pages, :visible
  end
end
