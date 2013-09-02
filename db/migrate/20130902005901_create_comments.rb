class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user, index: true
      t.belongs_to :plate, index: true

      t.timestamps
    end
  end
end
