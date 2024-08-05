class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:name,:image_url,:created_at,:email,:approved,:role
end
