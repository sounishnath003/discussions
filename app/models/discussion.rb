class Discussion < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  has_rich_text :content
  belongs_to :user
  has_one_attached :ref_photo

  has_many :likes, dependent: :destroy

  # code for adding taggings section
    def all_tags=(names)
      self.tags = names.split(',').map do |name|
        Tag.where(name: name.strip).create!
      end
    end

    def all_tags
      tags.map(&:name).join(', ')
    end

  # for searching
  def self.tagged_with(name)
    Tag.find_by_name!(name).discussions
  end

end
