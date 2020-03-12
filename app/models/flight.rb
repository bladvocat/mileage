# == Schema Information
#
# Table name: flights
#
#  id                 :integer          not null, primary key
#  booking_reference  :string
#  date_departure     :date
#  date_of_expiry     :date
#  description        :text
#  from_airport       :string
#  number_of_miles    :integer
#  program_name       :string
#  to_airport         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  mileage_program_id :integer
#  passenger_id       :integer
#

class Flight < ApplicationRecord
end
