class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:inbox]

  def home
    @inboxcaps = current_user.capsules.order(:arrival_date).reverse
    @categories = Category.all
    @users = get_user_list(User.all)
  end

  def inbox
    @outgoing = current_user.owned_capsules.order(:arrival_date)

    caps_arrived_unread = current_user.capsules.map do |capsule|
      capsule if capsule.arrival_date < Date.today && capsule.read == false
    end.compact.sort_by(&:arrival_date).reverse

    caps_not_arrived = current_user.capsules.map do |capsule|
      capsule if capsule.arrival_date > Date.today
    end.compact.sort_by(&:arrival_date)

    caps_opened = current_user.capsules.map do |capsule|
      capsule if capsule.read == true
    end.compact.sort_by(&:arrival_date).reverse

    @inboxcaps = caps_arrived_unread + caps_not_arrived + caps_opened

    @capsules = current_user.capsules
    @owned_capsules = current_user.owned_capsules
    @categories = Category.all
    @users = get_user_list(User.all)
  end

  private

  def get_user_list(users)
    users.map do |user|
      "#{user.first_name} #{user.last_name} - #{user.username}"
    end.sort
  end
end
