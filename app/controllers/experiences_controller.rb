class ExperiencesController < ApplicationController
  def destroy
    experience = Experience.find(params[:id])
    experience.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json do 
        render json: {message: 'sucess'}
      end
    end
  end
end
