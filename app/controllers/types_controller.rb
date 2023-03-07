class TypesController < ApplicationController
  def index
    @text = Text.where(title_id: params[:title_id]).pluck(:sentence)
  end

  def nomal
    @text = Text.where(title_id: params[:title_id]).pluck(:sentence)
  end
end
