class AddCssClassesToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :css_class, :string
    add_column :pages, :nav_item_css_class, :string
    add_column :pages, :nav_item_parameters, :string
  end

  def self.down
    remove_column :pages, :nav_item_parameters
    remove_column :pages, :nav_item_css_class
    remove_column :pages, :css_class
  end
end
