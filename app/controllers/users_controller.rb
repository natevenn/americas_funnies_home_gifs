class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:notice] = "You have successfully created a new account"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:error] = "Invalid Login"
      render :new
    end
  end

  def show
    @user = current_user
  end

  def index
    @categories = Category.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
