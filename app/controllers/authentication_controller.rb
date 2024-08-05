class AuthenticationController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:firebase_auth]

  def firebase_auth
    auth_header = request.headers['Authorization']
    Rails.logger.debug "Auth Header: #{auth_header}"

    if auth_header.present?
      id_token = auth_header.split(' ').last
      Rails.logger.debug "ID Token: #{id_token}"

      begin
        decoded_token = Firebase::Admin::Auth.verify_id_token(id_token)
        Rails.logger.debug "Decoded Token: #{decoded_token}"

        firebase_uid = decoded_token[:uid]

        user = User.find_or_create_by(firebase_uid: firebase_uid) do |u|
          u.email = decoded_token[:email]
          u.name = decoded_token[:name]
        end

        token = JsonWebToken.encode(user_id: user.id)

        render json: { token: token }, status: :ok
      rescue => e
        Rails.logger.error "Token Verification Error: #{e.message}"
        render json: { error: e.message }, status: :unauthorized
      end
    else
      render json: { error: 'Authorization header not found' }, status: :unauthorized
    end
  end
end