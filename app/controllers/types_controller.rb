class TypesController < ApplicationController
  def index
    title_query_id = params[:title_id]
    @text = Text.where(title_id: title_query_id).pluck(:sentence)
    @text_json = @text.to_json
  end

  def nomal
    title_query_id = params[:title_id]
    @text = Text.where(title_id: title_query_id).pluck(:sentence)
    @text_json = @text.to_json
  end
end
