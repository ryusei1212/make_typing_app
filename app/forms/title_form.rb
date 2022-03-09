class TitleForm
  include ActiveModel::Model
  attr_accessor :title, :sentence

   with_options presence: true do
    validates :title
    validates :sentence
  end

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      Title.new(title: title).save!
      Text.new(sentence: sentence).save!
    end
  end
  
 

  # delegate :persisted?, to: :title

  # def initialize(attributes = nil, title: Title.new)
  #   @title = title
  #   attributes ||= default_attributes
  #   super(attributes)
  # end


  # TitleFormオブジェクトをTitleのオブジェクトに変換している
  def to_model
    Title.new
  end
end
