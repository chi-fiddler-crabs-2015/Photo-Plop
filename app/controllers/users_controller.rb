class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to albums_path
    else
      @errors = @user.errors
      render :'new'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
