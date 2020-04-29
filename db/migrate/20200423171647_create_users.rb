class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :location
      t.string :twitter
      t.string :website
      t.string :bio
      t.string :user_img

      t.timestamps
    end
  end
end
