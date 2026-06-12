module Authenticatable
  extend ActiveSupport::Concern

  private

  def authenticate_user!
    token = request.headers["X-Session-Token"]

    return render json: { error: "Unauthorized" }, status: :unauthorized unless token

    # if Rails.env.development? && !NeonAuth::Session.schema_exists?
    #   @current_user = OpenStruct.new(id: 'dev-user-local', email: 'dev@local.test')
    #   return
    # end
    #

    begin
      payload, = JWT.decode(token, nil, false)

      Rails.logger.info payload.inspect



      puts payload["sub"]


      puts "\n\n\nSKIP_AUTH = #{ENV["SKIP_AUTH"]}"
      if Rails.env.development? && ENV["SKIP_AUTH"] == "true"
        puts "Authentication disabled"
        # @current_user = NeonAuth::User.first;
          @current_user = {
            id: payload["sub"],
            email: payload["email"],
            name: payload["name"]
        }
        return;
      end

      @current_user = NeonAuth::User.find_or_create_by!(
        id: payload["sub"]
      ) do |user|
        user.email = payload["email"]
      end

    rescue JWT::DecodeError
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  end
  # def authenticate_user!
  #   token = request.headers['X-Session-Token'] ||
  #           request.cookies['better-auth.session_token']

  #   puts "\n\ntoken: #{token}\n"
  #   return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

  #   session = NeonAuth::Session
  #               .includes(:user)
  #               .where(token: token)
  #               .where('"neon_auth"."session"."expiresAt" > ?', Time.current)
  #               .first

  #   return render json: { error: 'Session expired or invalid' }, status: :unauthorized unless session

  #   @current_user = session.user
  # end
end