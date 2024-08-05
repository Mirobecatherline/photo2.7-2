# # require 'firebase_admin'
# # # require "rails/all"
# # FirebaseAdmin.configure do |config|
# #   config.project_id = 'photo-auth-33f7b'
# #   config.credentials = '/home/catherine/Documents/coding projects/photography_update/photo/lib/photo-auth-33f7b-firebase-adminsdk-uxp6v-4fe40af858.json'
# # end

# # gem 'firebase-admin-sdk'

# # creds = Firebase::Admin::Credentials.from_file('/home/catherine/Documents/coding projects/photography_update/photo/lib/photo-auth-33f7b-firebase-adminsdk-uxp6v-4fe40af858.json')
# # app = Firebase::Admin::App.new(credentials: creds)
# require 'firebase/admin'

# credentials = Firebase::Admin::Credentials.from_file('/home/catherine/Documents/coding projects/photography_update/photo/lib/photo-auth-33f7b-firebase-adminsdk-uxp6v-4fe40af858.json')
# Firebase::Admin::App.new(credentials: credentials)