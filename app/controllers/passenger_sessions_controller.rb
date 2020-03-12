class PassengerSessionsController < ApplicationController
  # skip_before_action(:force_passenger_sign_in, { :only => [:new_session_form, :create_cookie] })

  def new_session_form
    render({ :template => "passenger_sessions/sign_in.html.erb" })
  end

  def create_cookie
    passenger = Passenger.where({ :email => params.fetch("query_email") }).at(0)
    
    the_supplied_password = params.fetch("query_password")
    
    if passenger != nil
      are_they_legit = passenger.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/passenger_sign_in", { :alert => "Incorrect password." })
      else
        session.store(:passenger_id, passenger.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/passenger_sign_in", { :alert => "No passenger with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
