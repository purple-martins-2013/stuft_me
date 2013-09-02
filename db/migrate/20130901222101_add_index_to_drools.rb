class AddIndexToDrools < ActiveRecord::Migration
  def change
    add_index :drools, [:user_id, :plate_id], :unique => true
  end
end
