class SkillsController < ApplicationController
  def destroy
    skill = Skill.find(params[:id])
    skill.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json do
        render json: {message: 'sucess'}
      end
    end
  end
end
