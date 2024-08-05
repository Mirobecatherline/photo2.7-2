class ImagesController < ApplicationController
    before_action :authorize_request, except: :create

      def index
        images=Image.all
        render json: images
      end
    def show
         user= @current_user
         id=user.id
         if id
            user_images=Image.where(user_id:id)
             render json: user_images
         else
             render json: { error: "User not logged in" }, status: :not_found
         end
    end
    def create
      image =params[:images]
      result=Cloudinary::Uploader.upload(image)
      photo = Image.create(user_id: params[:user_id], image_url: result['url'])
      if photo.save
         render json: photo
      else
         render json: photo.errors
   end
   #    if params[:images].present?
        
   #    # uploading using threads
     
   #             # create thread for each image
   #    threads = [];
   #    # images=Array.wrap(params[:images])
   #    images=params[:images]
   #    #create array to store threads
   #    images.each do |image|
   #       threads << Thread.new  do
   #          result=Cloudinary::Uploader.upload(image)
   #          photo = Image.create(user_id: params[:user_id], image_url: result['url'])
   #        if photo.save
   #           render json: photo
   #        else
   #           render json: photo.errors
   #        end
   #    end
   # end        #Waitfor all threads to complete
   #             threads.each(&:join)

    #   # Create a new thread
    # thread = Thread.new do
    #   # Get the array of images from the formData object
    #   images = params[:images]

    #   # Upload each image to Cloudinary
    #   results = []
    #   images.each do |image|
    #     result = Cloudinary::Uploader.upload(image)
    #     results << result
    #   end

    #   # Handle the results of the uploads
    #   if results.all? { |result| result["public_id"] }
    #     puts "uploaded"
    #   else
    #     puts "not uploaded"
    #   end
    # end

    # # Wait for the thread to finish
#     # thread.join
#   end
   end

end
