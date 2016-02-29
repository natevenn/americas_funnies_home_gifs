class FavoritesController < ApplicationController
  def destroy
    current_user.gifs.destroy(params[:gif])
    redirect_to user_path(current_user)
  end
end
