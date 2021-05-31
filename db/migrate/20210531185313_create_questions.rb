class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :number, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
