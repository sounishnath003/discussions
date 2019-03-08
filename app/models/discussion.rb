class Discussion < ApplicationRecord
  has_many :tags, through: :taggings
  has_many :taggings

  has_rich_text :content
  belongs_to :user
  has_one_attached :ref_photo

  has_many :likes, dependent: :destroy

  # code for adding taggings section
    def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
    end

    def all_tags
      tags.map(&:name).join(", ")
    end

end
