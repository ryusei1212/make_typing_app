class Text < ApplicationRecord
  belongs_to :title
  validates :sentence, presence: true, length: { maximum: 255}
end
