class Tagging < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  belongs_to :tag
end
