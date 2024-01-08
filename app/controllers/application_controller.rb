class ApplicationController < ActionController::Base
  before_action :authorized_user

  def authorized_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user
    @current_user
  end
end
