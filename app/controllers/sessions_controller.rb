class SessionsController < ApplicationController
    skip_before_action :authorized_user, only: :create

    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user
      else
        render json: { errors: ['Invalid username or password'] }, status: :unprocessable_entity
      end
    end
  
    def destroy
      user = current_user
      puts "Current User: #{user.inspect}"
      session[:user_id] = nil
      render json: user
    end
end
  