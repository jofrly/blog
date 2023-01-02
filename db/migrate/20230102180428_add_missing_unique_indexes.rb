class AddMissingUniqueIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :slug, unique: true
    add_index :users, :username, unique: true
  end
end
