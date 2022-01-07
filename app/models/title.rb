class Title < ApplicationRecord
  belongs_to :user
  has_many :texts, dependent: :destroy 
  validates :title, presence: true
end
