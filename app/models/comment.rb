class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content,
    presence: true,
    length: {maximum: 200}

  after_validation :replace_slangs

    private
    def replace_slangs
      content.gsub!(/fuck|shit|hell/, '****')
    end
end
