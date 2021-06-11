class CapsulesController < ApplicationController
  def create
    correct_category = Category.all[params[:capsule][:category].to_i]
    @capsule = Capsule.new(capsule_params)
    @capsule.category = correct_category
    @capsule.owner = current_user
    @capsule.save

    recipient = Recipient.new(user: User.where(first_name: params[:capsule][:users].split[0]).first, capsule: @capsule)
    recipient.save
    # no need for app/views/capsules/create.html.erb
    redirect_to inbox_path
  end

  def destoy
    @capsule = Capsule.find(params[:id])
    @capsule.destroy

    # no need for app/views/capsules/destroy.html.erb
    redirect_to capsules_path
  end

  def update
    @capsule = Capsule.find(params[:id])
    @capsule.read = true
    @capsule.save
    redirect_to inbox_path
  end

  private

  def capsule_params
    params.require(:capsule).permit(:arrival_date, :title, :message)
  end
end
