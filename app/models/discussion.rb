class Discussion < ApplicationRecord
  has_rich_text :content
  belongs_to :user

  has_many :likes, dependent: :destroy
end
