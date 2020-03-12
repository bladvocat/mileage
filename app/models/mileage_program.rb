# == Schema Information
#
# Table name: mileage_programs
#
#  id           :integer          not null, primary key
#  program_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MileageProgram < ApplicationRecord
  has_many :flights, :dependent => :nullify
end
