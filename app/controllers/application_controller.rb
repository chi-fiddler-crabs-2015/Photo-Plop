class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    if logged_in?
      redirect_to albums_path
    else
      redirect_to login_path
    end
  end

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def not_logged_in
    unless current_user
      redirect_to root_path
    end
  end

  # def group
  #   ["peoples", "homies", "peeps", "friends", "compadres", "comadres", "network", "bae", "cohortmates", "family", "colleagues", "team", "frenemies", "BFFs"].sample
  # end

  helper_method :current_user
end
