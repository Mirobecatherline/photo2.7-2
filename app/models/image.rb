class Image < ApplicationRecord
  belongs_to :user
  belongs_to :assigned_client, class_name: "User", foreign_key: "assigned_to", optional: true
  has_many :comments
  has_many :likes
end
