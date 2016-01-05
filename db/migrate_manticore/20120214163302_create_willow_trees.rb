class CreateWillowTrees < ActiveRecord::Migration
	
  def change
    create_table(:willow_trees) do |t|
      t.string   :name
      t.text     :description
    end
    create_table(:willow_branches) do |t|
      t.integer  :tree_id
      t.string   :name
      t.integer  :position, :default => 0
      t.string   :ancestry
      t.integer  :ancestry_depth, :default => 0
      t.string   :positions_depth_cache
      t.integer  :leaf_id
      t.string   :leaf_type
      t.string   :access_key
    end
    create_table(:willow_leaves) do |t|
      t.string :name
      t.string :route
      t.string :type
    end
    add_index :willow_branches, :ancestry
  end
  
end
