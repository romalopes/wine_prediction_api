module Authenticatable
  extend ActiveSupport::Concern

  # included do
  #   before_action :authenticate_user!
  # end

  private

  def authenticate_user!
    token = request.headers["X-Session-Token"]

    return render json: { error: "Unauthorized" }, status: :unauthorized unless token

    begin
      payload, = JWT.decode(token, nil, false)

      Rails.logger.info payload.inspect

      puts payload["sub"]
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