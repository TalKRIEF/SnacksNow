class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.boolean :booked
      t.references :user, null: false, foreign_key: true
      t.references :snack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
