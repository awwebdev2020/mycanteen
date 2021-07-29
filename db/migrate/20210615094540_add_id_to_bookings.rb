class AddIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_id, :bigint
  end
end
