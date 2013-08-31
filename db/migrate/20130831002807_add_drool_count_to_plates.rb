class AddDroolCountToPlates < ActiveRecord::Migration
  def change
    add_column :plates, :drool_count, :integer, :default => 0  
  end
end
