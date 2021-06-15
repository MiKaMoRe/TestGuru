class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tests, :users do |t|
      t.index %i[test_id user_id], unique: true
      t.integer :progress, null: false, default: 0
      t.integer :points, null: false, default: 0
    end
  end
end
