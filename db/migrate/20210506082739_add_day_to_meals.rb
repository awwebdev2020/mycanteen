class AddDayToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :day, :string
  end
end
