class EducationsController < ApplicationController
  def destroy
    education = Education.find(params[:id])
    education.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json do
        render json: {message: 'sucess'}
      end
    end
  end
end
