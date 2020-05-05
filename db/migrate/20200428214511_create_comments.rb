class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookmark, null: false, foreign_key: true
      t.string :comment_text

      t.timestamps
    end
  end
end
