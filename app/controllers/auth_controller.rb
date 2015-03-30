class AuthController < ApplicationController

  def new
    render :login
  end

  def login
    user = User.authenticate(params[:user])
    if user
      session[:user_id] = user.id
      redirect_to albums_path
    else
      flash[:alert] = "You entered in the wrong username or password"
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  helper_method :group
end
