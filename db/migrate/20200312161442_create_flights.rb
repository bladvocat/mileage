class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :passenger_id
      t.string :from_airport
      t.string :to_airport
      t.date :date_departure
      t.string :booking_reference
      t.string :program_name
      t.integer :mileage_program_id
      t.integer :number_of_miles
      t.date :date_of_expiry
      t.text :description

      t.timestamps
    end
  end
end
