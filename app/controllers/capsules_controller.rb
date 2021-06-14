class CapsulesController < ApplicationController
  def create
    correct_category = Category.find([params[:capsule][:category].to_i]).first
    @capsule = Capsule.new(capsule_params)
    @capsule.category = correct_category
    @capsule.owner = current_user
    @capsule.arrival_date = @capsule.arrival_date + params[:timezone_offset].to_i.minutes
    @capsule.save

    recipient = Recipient.new(user: User.where(first_name: params[:capsule][:users].split[0]).first, capsule: @capsule)
    recipient.save

    gain_experience

    # no need for app/views/capsules/create.html.erb
    redirect_to inbox_path
  end

  def destroy
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

  def gain_experience
    current_user.update(experience: current_user.experience + 10) unless current_user.experience == 800
  end

  # def unlock_badges
  #   unlock_level_badges
  #   @capsule.category.downcase = category
  #   if category == 'general'
  #     UserBadge.create(user: current_user) if current_user.badges # badge: badgeID if user does not have badge
  #   elsif category == 'birthday'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'newyears'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'Wedding'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'Confession'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'Graduation'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'Anniversary'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'Festival'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'Prediction'
  #     UserBadge.create(user: current_user)
  #   elsif category == 'Inheritance'
  #     UserBadge.create(user: current_user)
  #   end
  # end

  def unlock_level_badges

  end
end
