class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:tests, :level, false)
  end

  def down
    change_column_default(:tests, :level, nil)
  end
end
