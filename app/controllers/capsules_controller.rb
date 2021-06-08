class CapsulesController < ApplicationController

  before_action :set_capsule, only: [:create, :destroy]

  def create
    @capsule = Capsule.new(capsule_params)
    @capsule.save

    # no need for app/views/capsules/create.html.erb
    redirect_to capsules_path(@Capsule)
  end


  def destoy
    @capsule = Capsule.find(params[:id])
    @capsule.destroy

    # no need for app/views/capsules/destroy.html.erb
    redirect_to capsules_path
  end
  
  private

  def set_capsule
    @capsule = Capsule.find(params[:id])
  end

  def capsules_params
    params.require(:capsule).permit(:owner, :category, :arrival_date, :message, :title)
  end


end

