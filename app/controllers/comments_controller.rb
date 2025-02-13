class CommentsController < ApplicationController
    def create
        user = User.find_by(uid: params[:uid])
        if user
          comment = user.comments.create(image_id: params[:image_id], content: params[:content])
          render json: comment
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end
end
# Any logged-in user can comment on a photo.
