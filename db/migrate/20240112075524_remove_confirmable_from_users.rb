class RemoveConfirmableFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :confirmation_token, :string

    remove_index :users, column: :confirmation_token, if_exists: true
  end
end
