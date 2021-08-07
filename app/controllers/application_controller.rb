class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  private

  def require_logged_in
    redirect_to root_path unless current_user
  end

end
