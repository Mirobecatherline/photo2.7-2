class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def create

        user=User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: user.id)
            time = Time.now + 24.hours.to_i
            render json: {user: user, token: token, exp: time.strftime("%m-%d-%Y %H:%M") }, status: :ok
        else
            render json: {errors:["invalid username or password"]}, status: :unauthorized
        end
    end
    # def destroy
    #     session.delete :user_id
    #     head :no_content
    # end photo/lib/photo-auth-33f7b-firebase-adminsdk-uxp6v-4fe40af858.json
    private
    def render_not_found_response
        render json: {errors: ["user not found"]}
    end
end
