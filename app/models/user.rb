class User < ApplicationRecord
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :posts
  has_many :comments
  has_many :likes
end