class CreateEvents < ActiveRecord::Migration
	
  def change
    create_table(:events) do |t|
      t.string   :title
      t.string   :image
      t.string   :image_alt
      t.string   :venue
      t.decimal  :price, :precision => 5, :scale => 2
      t.text     :summary
      t.text     :content
      t.date     :date_start
      t.date     :date_end
      t.text     :meta_description
      t.text     :meta_tags
      t.boolean  :highlight, :default => false
      t.boolean  :display,   :default => true
      t.timestamps
    end
  end
  
end
