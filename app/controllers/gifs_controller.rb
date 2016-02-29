class GifsController < ApplicationController
  def update
    gif = Gif.find(params[:id])
    current_user.gifs << gif
    redirect_to category_path(gif.category_id)
  end



end
