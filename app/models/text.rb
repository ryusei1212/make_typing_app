class Text < ApplicationRecord
  belongs_to :title
  validates :sentence, presence: true

  # def self.multi_update(texts_params)
  #   texts_params.to_h.map do |id, text_param|
  #     text = self.find(id)
  #     text.update!(text_param)
  #   end
  # end
end
