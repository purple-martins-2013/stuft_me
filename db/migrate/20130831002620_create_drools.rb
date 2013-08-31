class CreateDrools < ActiveRecord::Migration
  def change
    create_table :drools do |t|
      t.references :user
      t.references :plates

      t.timestamps
    end
  end
end
