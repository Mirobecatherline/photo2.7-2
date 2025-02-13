class User < ApplicationRecord
    has_many :images
    has_many :comments
    has_many :likes
  
    validates :email, presence: true, uniqueness: true
    validates :role, inclusion: { in: %w[client photographer admin] }
end
