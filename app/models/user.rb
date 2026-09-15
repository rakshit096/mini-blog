class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy  # dependent destroy deletes all articles that are associated with deleted user
end
