class User < ApplicationRecord
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name,
    presence: true,
    length: { maximum: 10 },
    format: { with: /\A[A-Z][\w]*/}
  validates :age,
    presence: true,
    numericality: {only_integer: true, grater_than_or_equal_to: 20, less_than: 30}
  validates :mail,
    presence: true,
    uniqueness: true,
    format: { with: /[\w]+[@][\w]+[.][\w]+/ }
end
