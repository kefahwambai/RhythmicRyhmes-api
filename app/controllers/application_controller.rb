class ApplicationController < ActionController::API
 
  before_action :authorized_user

  def encode_token(payload)
    payload[:exp] = 5.minutes.from_now.to_i
    JWT.encode(payload, ENV['SECRET_KEY_BASE'])
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        JWT.decode(token, ENV['SECRET_KEY_BASE'])
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
  end

  def authorized_user
    unless !!current_user
      render json: { error: 'You need to log in first' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
end
