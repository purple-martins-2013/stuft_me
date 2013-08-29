class RemoveTokenAndSecretFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :token, :string
    remove_column :users, :secret, :string
  end
end
