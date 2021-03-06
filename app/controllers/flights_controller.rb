class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order({ :created_at => :desc })

    render({ :template => "flights/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @flight = Flight.where({:id => the_id }).at(0)

    render({ :template => "flights/show.html.erb" })
  end

  def create
    @flight = Flight.new
    @flight.from_airport = params.fetch("query_from_airport")
    @flight.to_airport = params.fetch("query_to_airport")
    @flight.date_departure = params.fetch("query_date_departure")
    @flight.booking_reference = params.fetch("query_booking_reference")
    @flight.program_name = params.fetch("query_program_name")
    @flight.number_of_miles = params.fetch("query_number_of_miles")
    @flight.date_of_expiry = params.fetch("query_date_of_expiry")
    @flight.description = params.fetch("query_description")

    if @flight.valid?
      @flight.save
      redirect_to("/flights", { :notice => "Flight created successfully." })
    else
      redirect_to("/flights", { :notice => "Flight failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.passenger_id = params.fetch("query_passenger_id")
    @flight.from_airport = params.fetch("query_from_airport")
    @flight.to_airport = params.fetch("query_to_airport")
    @flight.date_departure = params.fetch("query_date_departure")
    @flight.booking_reference = params.fetch("query_booking_reference")
    @flight.program_name = params.fetch("query_program_name")
    @flight.number_of_miles = params.fetch("query_number_of_miles")
    @flight.date_of_expiry = params.fetch("query_date_of_expiry")
    @flight.description = params.fetch("query_description")

    if @flight.valid?
      @flight.save
      redirect_to("/flights/#{@flight.id}", { :notice => "Flight updated successfully."} )
    else
      redirect_to("/flights/#{@flight.id}", { :alert => "Flight failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.destroy

    redirect_to("/flights", { :notice => "Flight deleted successfully."} )
  end
end
