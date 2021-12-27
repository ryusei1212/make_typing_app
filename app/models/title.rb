class Title < ApplicationRecord
  belongs_to :user
  has_many :texts
  validates :title, presence: true
end
