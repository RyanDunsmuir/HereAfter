class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :inbox ]

  def home
    @inboxcaps = current_user.capsules.order(:arrival_date).reverse
  end

  def inbox
    @capsules = current_user.capsules
    @owned_capsules = current_user.owned_capsules

  end
end
