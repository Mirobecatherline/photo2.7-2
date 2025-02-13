class LikesController < ApplicationController
    def create
        user = User.find_by(uid: params[:uid])
        if user
          like = user.likes.find_or_create_by(image_id: params[:image_id])
          render json: like
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end
end
# Any logged-in user can like a photo.
