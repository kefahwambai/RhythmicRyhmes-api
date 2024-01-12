class RemoveJtiFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :jti, :string

    remove_index :users, :jti, if_exists: true
  end
end