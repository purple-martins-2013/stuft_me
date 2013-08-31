class AddDroolStatusToDrools < ActiveRecord::Migration
  def change
    add_column :drools, :drool_status, :boolean  
  end
end
