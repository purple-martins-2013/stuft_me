class AddUrlAndProfilePicToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_url, :string
    add_column :users, :profile_pic, :string
  end
end
