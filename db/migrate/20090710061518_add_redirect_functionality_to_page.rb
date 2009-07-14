class AddRedirectFunctionalityToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :redirect, :boolean
    add_column :pages, :redirect_page_id, :integer
    add_column :pages, :redirect_url, :string
  end

  def self.down
    remove_column :pages, :redirect_url
    remove_column :pages, :redirect_page_id
    remove_column :pages, :redirect
  end
end
