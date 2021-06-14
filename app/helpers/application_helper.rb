module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Return the level that the user is
  def define_level(user)
    user_xp = user.experience
    levels = %w(0 10 30 50 80 110 150 200 260 330 400 480 570 670 800)
    levels.each_with_index do |level_xp, index|
      return index + 1 if (user_xp >= level_xp.to_i && user_xp < levels[index + 1].to_i)
    end
  end

  def progress_bar(user)
    user_xp = user.experience
    levels = %w(0 10 30 50 80 110 150 200 260 330 400 480 570 670 800)
    current_level_index = define_level(user) - 1
    next_level_index = current_level_index + 1
    level_range = levels[next_level_index].to_i - levels[current_level_index].to_i
    current_level_xp = user_xp - levels[current_level_index].to_i
    ((current_level_xp.to_f / level_range.to_f) * 100).round
  end

end
