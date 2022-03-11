class Title < ApplicationRecord
  belongs_to :user
  has_many :texts, dependent: :destroy 
  accepts_nested_attributes_for :texts, reject_if: :all_blank, allow_destroy: true

  validates_associated :texts
  validates :title, presence: true
  validates :texts, presence: true
end
