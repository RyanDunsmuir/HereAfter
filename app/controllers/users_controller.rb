class UsersController < ApplicationController
  def update
    current_user.update(avatar_photo: params[:avatar])
    redirect_to avatar_path
  end
end
