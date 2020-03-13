namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    Passenger.destroy_all
    Flight.destroy_all
    MileageProgram.destroy_all
    
    bruno = Passenger.new
    bruno.email = "bladvocat@hotmail.com"
    bruno.password = "1234"
    bruno.save

    flight = Flight.new
    flight.from_airport = "ORD"
    flight.to_airport = "LAX"
    flight.date_departure = Time.new(2020, 1, 1)
    flight.booking_reference = "ABCDE"
    flight.program_name = "Delta SkyMiles"
    flight.number_of_miles = "1000"
    flight.date_of_expiry = Time.new(2021, 1, 1)
    flight.description = "Flight from Chicago to LA"
    flight.save

    flight = Flight.new
    flight.from_airport = "SDU"
    flight.to_airport = "CGH"
    flight.date_departure = Time.new(2019, 6, 10)
    flight.booking_reference = "YUIFO"
    flight.program_name = "Gol Smiles"
    flight.number_of_miles = "500"
    flight.date_of_expiry = Time.new(2020, 6, 10)
    flight.description = "Flight from Rio to SP"
    flight.save

    flight = Flight.new
    flight.from_airport = "MAD"
    flight.to_airport = "MEX"
    flight.date_departure = Time.new(2019, 12, 5)
    flight.booking_reference = "LDJFG"
    flight.program_name = "Iberia Avios"
    flight.number_of_miles = "4500"
    flight.date_of_expiry = Time.new(2020, 12, 5)
    flight.description = "Flight from Madrid to Mexico"
    flight.save

  end
end
