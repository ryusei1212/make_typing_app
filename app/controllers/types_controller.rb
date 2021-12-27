class TypesController < ApplicationController
  def index
    title_quel_id = params[:title_id]
    @text = Text.where(title_id: title_quel_id).pluck(:sentence)
    @text_json = @text.to_json
  end
end
