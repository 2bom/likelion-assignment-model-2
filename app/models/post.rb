class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes


  validates :title,
    presence: true,
    length: {minimum: 2, maximum: 30}
  validates :content,
    presence: true

  after_validation :replace_slangs

    private
    def replace_slangs
      content.gsub!(/fuck|shit|hell/, '****')
    end
end
