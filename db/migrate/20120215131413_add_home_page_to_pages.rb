class AddHomePageToPages < ActiveRecord::Migration
	
  def change
    add_column :pages, :home_page, :boolean, :default => false
  end
  
end
