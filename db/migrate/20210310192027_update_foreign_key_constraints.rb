class UpdateForeignKeyConstraints < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :bookmarks, :users
    remove_foreign_key :comments, :bookmarks
    remove_foreign_key :comments, :users
    add_foreign_key :bookmarks, :users, on_delete: :cascade
    add_foreign_key :comments, :bookmarks, on_delete: :cascade
    add_foreign_key :comments, :users, on_delete: :cascade
  end
end
