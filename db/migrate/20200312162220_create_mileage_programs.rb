class CreateMileagePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :mileage_programs do |t|
      t.string :program_name

      t.timestamps
    end
  end
end
