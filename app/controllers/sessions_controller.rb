class SessionsController < ApplicationController
    skip_before_action :authorized_user, only: [:create, :delete]

    def create
      user = User.find_by!(email: params[:email])  
      if user.authenticate(params[:password])
        @token = encode_token(user_id: user.id)
        render json: {  
          user: UserSerializer.new(user),        
          token: @token
        }, status: :accepted
      else
        render json: { errors: ['Invalid username or password'] }, status: :unprocessable_entity
      end
    end
  
    def destroy
      if current_user
        render json: {
          status: 200, message: 'Logged out successfully'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end


end
  