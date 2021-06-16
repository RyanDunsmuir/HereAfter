class CapsulesController < ApplicationController
  def create
    correct_category = Category.where(name: params[:capsule][:category]).first
    @capsule = Capsule.new(capsule_params)
    @capsule.category = correct_category
    @capsule.owner = current_user
    local_arrival_date = @capsule.arrival_date
    @capsule.arrival_date = @capsule.arrival_date + params[:timezone_offset].to_i.minutes
    @capsule.save

    recipient = Recipient.new(user: User.where(first_name: params[:capsule][:users].split[0]).first, capsule: @capsule)
    recipient.save

    users_badges = current_user.badges.count # 3
    users_badges_titles = current_user.badges.map { |badge| badge.title }

    gain_experience
    unlock_level_badges(current_user)
    unlock_category_badges(current_user, @capsule.category.name)
    unlock_midnight_badge(current_user, local_arrival_date)

    new_users_badges_titles = current_user.badges.map { |badge| badge.title }
    # no need for app/views/capsules/create.html.erb
    if current_user.badges.count > users_badges
      # titles = users_badges_titles - new_users_badges_titles
      # string = ""

      # titles.each do |title|
      #   if title == titles[-1]
      #     string += title.to_s
      #   elsif title == titles[-2]
      #     string += "#{title} and "
      #   else
      #     string += "#{title}, "
      #   end
      # end

      redirect_to inbox_path, notice: "⭐️ You just unlocked a Badge!"
    else
      redirect_to inbox_path
    end
end

  def destroy
    @capsule = Capsule.find(params[:id])
    @capsule.destroy

    # no need for app/views/capsules/destroy.html.erb
    # redirect_back fallback_location: "/inbox"
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

  def unlock_level_badges(user)
    level = define_level(user)
    badge_levels = [2, 5, 10, 15]
    if badge_levels.include?(level)
      badge = Badge.where(title: "Level #{level == 2 ? level - 1 : level}").first
      UserBadge.create(user: user, badge: badge)
    end
  end

  def define_level(user)
    user_xp = user.experience
    if user_xp >= 800
      return 15
    else
      levels = %w(0 10 30 50 80 110 150 200 260 330 400 480 570 670 800)
      levels.each_with_index do |level_xp, index|
        return index + 1 if (user_xp >= level_xp.to_i && user_xp < levels[index + 1].to_i)
      end
    end
  end

  def unlock_category_badges(user, category)
    categories = ["General", "Birthday", "Confession", "Prediction"]
    if categories.include?(category)
      badge = Badge.where(title: category).first
      UserBadge.create(user: user, badge: badge)
    end
  end

  def unlock_midnight_badge(user, date)
    if (date.to_f % 86_400).zero?
      badge = Badge.where(title: "Midnight").first
      UserBadge.create(user: user, badge: badge)
    end
  end

end
