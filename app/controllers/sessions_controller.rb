class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end


private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
