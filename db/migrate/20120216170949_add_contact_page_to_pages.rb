class AddContactPageToPages < ActiveRecord::Migration
	
  def change
    add_column :pages, :contact_page, :boolean, :default => false
  end
  
end
