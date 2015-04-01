class AuthController < ApplicationController
  def new
    render :login
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to albums_path
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

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
