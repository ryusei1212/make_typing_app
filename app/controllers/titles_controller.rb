class TitlesController < ApplicationController

  def index
    @title = Title.all
  end

  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    @title.user_id = current_user.id
    if @title.save
      flash[:success] = "タイトルの保存に成功しました、続けてテキストを作成してください"
       redirect_to new_text_path(title_id: @title.id)
    else
      flash.now[:danger] = "タイトルを入力してください"
      render 'new'
    end
  end

  def edit
    @title = Title.includes(:texts).find(params[:id])
  end

  def update
    @title = Title.find(params[:id])
    if ActiveRecord::Base.transaction do
      @title.update!(title_params)
      Text.multi_update(text_params)
    end
      redirect_to titles_path
    else
      render 'edit'
    end
  end

  def destroy
    Title.find(params[:id]).destroy
    redirect_to titles_path
  end

end

private

  def title_params
    params.require(:title).permit(:title)
  end

  def text_params
    params.require(:title).permit(sentence: :sentence)[:sentence]
  end

