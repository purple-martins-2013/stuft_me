class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.belongs_to :user
      t.string :url
      t.string :description
      t.string :location
      t.string :price

      t.timestamps
    end
  end
end
