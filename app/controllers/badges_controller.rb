class BadgesController < ApplicationController
  before_action :set_badge, except: %i[index]

  def index
    @badges = Badge.all
  end

  def show
    # before action already sets which badge should be showed from the private method
  end

  def update
    @badge.locked = false
    @badge.save
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
