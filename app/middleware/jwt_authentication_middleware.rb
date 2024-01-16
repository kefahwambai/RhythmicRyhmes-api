# class JwtAuthenticationMiddleware
#     def initialize(app)
#       @app = app
#     end
  
#     def call(env)
#       request = Rack::Request.new(env)
#       token = extract_token(request)
  
#       if token
#         decoded_token = decode_token(token)
#         if decoded_token
#           env['current_user'] = User.find(decoded_token['user_id'])
#         end
#       end
  
#       @app.call(env)
#     end
  
#     private
  
#     def extract_token(request)
#       request.env['HTTP_AUTHORIZATION']&.split(' ')&.last
#     end
  
#     def decode_token(token)
#       begin
#         JWT.decode(token, ENV['SECRET_KEY_BASE']).first
#       rescue JWT::DecodeError
#         nil
#       end
#     end
# end
  