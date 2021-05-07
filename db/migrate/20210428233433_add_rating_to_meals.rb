class AddRatingToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :rating, :integer
    add_column :meals, :price, :decimal
  end
end
