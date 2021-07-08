class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :type, null: false, default: 'User'
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :users, :type
  end
end
