class MakeUniquePlateTagIndex < ActiveRecord::Migration
  def change
    add_index :plates_tags, [:plate_id, :tag_id], :unique => true
  end
end
