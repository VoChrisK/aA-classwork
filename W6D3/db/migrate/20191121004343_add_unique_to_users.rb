class AddUniqueToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username, :string, unique: true
    add_index :users, :username, unique: true
  end
end
