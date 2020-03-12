ActiveAdmin.register Flight do
  permit_params :passenger_id, :from_airport, :to_airport, :date_departure, :booking_reference, :program_name, :mileage_program_id, :number_of_miles, :date_of_expiry, :description


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
