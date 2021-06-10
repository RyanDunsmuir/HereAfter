class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:inbox]

  def home
    @inboxcaps = current_user.capsules.order(:arrival_date).reverse
    @categories = Category.all
    @users = get_user_list(User.all)
  end

  def inbox
    @inboxcaps = current_user.capsules.order(:arrival_date).reverse
    @outgoing = current_user.owned_capsules
    @incoming = current_user.capsules.where(:read == false)
    # @inboxcaps = @incoming + @outgoing
    @capsules = current_user.capsules
    @owned_capsules = current_user.owned_capsules
    @categories = Category.all
    @users = get_user_list(User.all)
  end

  def test
  end

  private

  def get_user_list(users)
    users.map do |user|
      "#{user.first_name} #{user.last_name} - #{user.username}"
    end.sort
  end
end
