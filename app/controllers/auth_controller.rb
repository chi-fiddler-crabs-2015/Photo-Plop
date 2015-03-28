class AuthController < ApplicationController

  def new
    @user = User.new
  end

  def login
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:alert] = "You entered in the wrong username or password"
    end
  end

  def logout
    session[:user_id].clear
    redirect_to root_path
  end

end
