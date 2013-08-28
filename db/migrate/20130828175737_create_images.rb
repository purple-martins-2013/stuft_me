class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :description
      t.string :location
      t.string :price

      t.timestamps
    end
  end
end
