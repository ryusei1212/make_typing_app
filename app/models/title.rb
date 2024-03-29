class Title < ApplicationRecord
  belongs_to :user
  has_many :texts, dependent: :destroy 
  accepts_nested_attributes_for :texts, reject_if: :all_blank, allow_destroy: true

  validates_associated :texts
  validates :title, presence: true, length: { maximum: 40}
  validates :texts, presence: true, length: { maximum: 255}
end
