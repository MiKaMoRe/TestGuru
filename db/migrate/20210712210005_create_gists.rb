class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.string :user, null: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
