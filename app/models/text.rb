class Text < ApplicationRecord
  belongs_to :title
  validates :sentence, presence: true
end
