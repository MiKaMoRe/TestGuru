class AddResultsPointsNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:results, :points, false)
  end
end
