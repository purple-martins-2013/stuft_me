class CreatePlatesTags < ActiveRecord::Migration
  def change
    create_table :plates_tags do |t|
      t.belongs_to :plate, index: true
      t.belongs_to :tag, index: true
    end
  end
end
