class PassengersController < ApplicationController
  # skip_before_action(:force_passenger_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "passenger_sessions/sign_up.html.erb" })
  end

  def create
    @passenger = Passenger.new
    @passenger.email = params.fetch("query_email")
    @passenger.password = params.fetch("query_password")
    @passenger.password_confirmation = params.fetch("query_password_confirmation")

    save_status = @passenger.save

    if save_status == true
      session.store(:passenger_id,  @passenger.id)
   
      redirect_to("/", { :notice => "Passenger account created successfully."})
    else
      redirect_to("/passenger_sign_up", { :alert => "Passenger account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "passengers/edit_profile.html.erb" })
  end

  def update
    @passenger = @current_passenger
    @passenger.email = params.fetch("query_email")
    @passenger.password = params.fetch("query_password")
    @passenger.password_confirmation = params.fetch("query_password_confirmation")
    
    if @passenger.valid?
      @passenger.save

      redirect_to("/", { :notice => "Passenger account updated successfully."})
    else
      render({ :template => "passengers/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_passenger.destroy
    reset_session
    
    redirect_to("/", { :notice => "Passenger account cancelled" })
  end
  
end
