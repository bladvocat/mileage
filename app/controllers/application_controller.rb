class ApplicationController < ActionController::Base
  before_action(:load_current_passenger)
  
  # before_action(:force_passenger_sign_in)
  
  def load_current_passenger
    the_id = session.fetch(:passenger_id)
    @current_passenger = Passenger.where({ :id => the_id }).at(0)
  end
  
  def force_passenger_sign_in
    if @current_passenger == nil
      redirect_to("/passenger_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
