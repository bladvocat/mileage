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

    





  end
end
