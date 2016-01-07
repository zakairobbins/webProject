class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
    3.times { @request.experiences.build }
    2.times { @request.educations.build }
    2.times { @request.volunteers.build }
    2.times { @request.skills.build }
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:success] = "thank you for your order"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :address, :phone_number, :objective, experiences_attributes: [:company, :location, :start_date, :end_date, :job_title, :responsibilities, :awards], educations_atributes: [:school_name, :degree, :location, :awards, :graduation_date], skills_attributes: [:description], volunteers_attributes: [:organization, :location, :start_date, :end_date, :duties])
  end
end
