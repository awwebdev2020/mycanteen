class AddDateToMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :date, :date
  end
end
