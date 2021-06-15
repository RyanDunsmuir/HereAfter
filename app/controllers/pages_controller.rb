class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:inbox]
  before_action :set_users_and_categories, except: [:home]

  def home
  end

  def profile
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
  end

  def incoming
    @inboxcaps = current_user.capsules.map do |capsule|
      capsule if capsule.arrival_date > Date.today
    end.compact.sort_by(&:arrival_date)
  end

  def outgoing
    @inboxcaps = current_user.owned_capsules
  end

  def opened
    @inboxcaps = current_user.capsules.map do |capsule|
      capsule if capsule.read == true
    end.compact.sort_by(&:arrival_date).reverse
  end

  def test
  end

  private

  def get_user_list(users)
    users.map do |user|
      "#{user.first_name} #{user.last_name} - #{user.username}"
    end.sort
  end

  def set_users_and_categories
    @categories = Category.all
    @users = get_user_list(User.all)
  end
end
