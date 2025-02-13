# class UsersController < ApplicationController
#     before_action :authorize_request, except: :create
#     # before_action :find_user, except: %i[create index]

#     def index
#         user=User.all
#         render json: user, status: :ok
#     end    
#     def show
#          user= @current_user
#          if user
#              render json: user
#          else
#              render json: { error: "User not found" }, status: :not_found
#          end
#     end
    
#   def create
#     @user = User.new(user_params)
#     if @user.save
#       if (params[:role]==="admin")
#         @user.update(role:'admin')
#       render json: @user, status: :created
#       end
#     else
#       render json: { errors: @user.errors.full_messages },
#              status: :unprocessable_entity
#     end
#   end

#     # def show
#     #     render json: @user, status: :ok
      
#     # end
#     private

#     def user_params
#         params.permit(:name,:email,:username,:password, :password_confirmation,:image_url)
#     end
# end

class UsersController < ApplicationController
  def register
    user = User.find_or_create_by(uid: params[:uid]) do |u|
      u.name = params[:name]
      u.email = params[:email]
      u.photo_url = params[:photo_url]
      u.role = "client"
    end
    render json: user
  end

  def index
    users = User.all
    render json: users
  end

  def update_role
    user = User.find(params[:id])
    if params[:role] && current_admin?
      user.update(role: params[:role])
      render json: { message: "User role updated successfully", user: user }
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  private

  def current_admin?
    admin_user = User.find_by(id: params[:admin_id])
    admin_user && admin_user.role == "admin"
  end
end
# When the frontend sends user details (Firebase UID, name, email, photo), it’s stored in the DB.
# New users get a "client" role by default.
# The admin can update a user’s role to photographer or admin.