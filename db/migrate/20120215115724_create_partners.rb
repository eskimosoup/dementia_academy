class CreatePartners < ActiveRecord::Migration
	
  def change
    create_table(:partners) do |t|
      t.string   :title
      t.string   :image
      t.string   :image_alt
      t.string   :web
      t.text     :summary
      t.integer  :position
      t.boolean  :display, :default => true
      t.timestamps
    end
  end
  
end
