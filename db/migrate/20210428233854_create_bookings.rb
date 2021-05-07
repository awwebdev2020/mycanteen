class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :day
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
    end
  end
end
