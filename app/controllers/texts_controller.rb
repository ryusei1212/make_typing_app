class TextsController < ApplicationController


  def index
  end

  def new
    @text = Text.new
    @text.title_id = params[:title_id]
  end

  def create
    @text = Text.new(text_params)
    if @text.save
      flash[:success] = "テキストの保存に成功"
      redirect_to titles_path
    else
      flash.now[:danger] = "テキストを入力してください"
      render 'new'
    end
  end
end

private

  def text_params
    params.require(:text).permit(:sentence, :title_id)
  end
