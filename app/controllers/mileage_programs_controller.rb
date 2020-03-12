class MileageProgramsController < ApplicationController
  def index
    @mileage_programs = MileageProgram.all.order({ :created_at => :desc })

    render({ :template => "mileage_programs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @mileage_program = MileageProgram.where({:id => the_id }).at(0)

    render({ :template => "mileage_programs/show.html.erb" })
  end

  def create
    @mileage_program = MileageProgram.new
    @mileage_program.program_name = params.fetch("query_program_name")

    if @mileage_program.valid?
      @mileage_program.save
      redirect_to("/mileage_programs", { :notice => "Mileage program created successfully." })
    else
      redirect_to("/mileage_programs", { :notice => "Mileage program failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @mileage_program = MileageProgram.where({ :id => the_id }).at(0)

    @mileage_program.program_name = params.fetch("query_program_name")

    if @mileage_program.valid?
      @mileage_program.save
      redirect_to("/mileage_programs/#{@mileage_program.id}", { :notice => "Mileage program updated successfully."} )
    else
      redirect_to("/mileage_programs/#{@mileage_program.id}", { :alert => "Mileage program failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @mileage_program = MileageProgram.where({ :id => the_id }).at(0)

    @mileage_program.destroy

    redirect_to("/mileage_programs", { :notice => "Mileage program deleted successfully."} )
  end
end
