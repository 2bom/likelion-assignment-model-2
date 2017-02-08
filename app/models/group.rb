class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name,
    presence: true,
    length: { maximum: 20},
    uniqueness: true
end
