class SessionsController < ApplicationController
    skip_before_action :authorized_user, only: :create

    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: :success
      else
        render json: { errors: ['Invalid username or password'] }, status: :unprocessable_entity
      end
    end
  
    def destroy
      session[:user_id] = nil
      render json: :success
    end
end
  