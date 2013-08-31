class RenamePlateReferenceInDrools < ActiveRecord::Migration
  def change
    remove_column :drools, :plates_id, :integer
    add_column :drools, :plate_id, :integer
  end
end
