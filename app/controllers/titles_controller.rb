class TitlesController < ApplicationController
  # logged_in_userメソッドはsession_helper内に記載
  before_action :logged_in_user, only: [:index, :edit, :update]

  def index
    @title = Title.all
  end

  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    @title.user_id = current_user.id
    @text = Text.new(text_params)

    if @title.valid?
      ActiveRecord::Base.transaction do
        @title.save!
        @text.title_id = @title.id
        text_params[:sentence].each do |sentence|
          @text = Text.new(sentence: sentence, 
                           title_id: @title.id )
          @text.valid?
          @text.save!
        end
        flash[:success] = "#{@title.title}を作成しました"
      end
      redirect_to titles_path
    else
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
      Text.multi_update(text_update_params)
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
    params.require(:text).permit(:title_id, sentence: [])
  end

  # 複数テキストの更新用メソッド
  def text_update_params
    params.require(:title).permit(sentence: :sentence)[:sentence]
  end

