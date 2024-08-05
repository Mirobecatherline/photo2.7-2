class UsersController < ApplicationController
    before_action :authorize_request, except: :create
    # before_action :find_user, except: %i[create index]

    def index
        user=User.all
        render json: user, status: :ok
    end    
    def show
         user= @current_user
         if user
             render json: user
         else
             render json: { error: "User not found" }, status: :not_found
         end
    end
    
  def create
    @user = User.new(user_params)
    if @user.save
      if (params[:role]==="admin")
        @user.update(role:'admin')
      render json: @user, status: :created
      end
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

    # def show
    #     render json: @user, status: :ok
      
    # end
    private

    def user_params
        params.permit(:name,:email,:username,:password, :password_confirmation,:image_url)
    end
end
