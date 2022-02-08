class TextsController < ApplicationController


  def index
  end

  def new
    @text = Text.new
    @text.title_id = params[:title_id]
  end

  def create
    multi_text_params[:sentence].each do |sentence|
      @text = Text.new(sentence: sentence, 
                       title_id: multi_text_params[:title_id] )
      @text.save
    end

    if @text.save
      flash[:success] = "テキストの保存に成功"
      redirect_to titles_path
    else
      render 'new'
    end
  end
end

private

  #変更後
  def multi_text_params
    params.require(:text).permit(:title_id, sentence: [])
  end

  # 変更前
  # def text_params
  #   params.require(:text).permit(:title_id, :sentence)
  # end
