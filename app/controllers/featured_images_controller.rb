class FeaturedImagesController < ApplicationController
    before_action :authorize_request, except: :index

    def index
        featured_images=FeaturedImage.all
        render json: featured_images ,status: :ok
    end
end
