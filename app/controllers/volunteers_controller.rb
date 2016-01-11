class VolunteersController < ApplicationController
  def destroy
    volunteer = Volunteer.find(params[:id])
    volunteer.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json do
        render json: {message: 'sucess'}
      end
    end
  end
end
