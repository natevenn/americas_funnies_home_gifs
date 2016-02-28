class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.default?
        redirect_to user_path(@user.id)
      elsif @user.admin?
        redirect_to  admin_path
      else
        render file: '/public/404'
      end
    else
      render :new
    end
  end


private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
