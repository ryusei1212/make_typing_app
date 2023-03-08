class TitlesController < ApplicationController
  # logged_in_userメソッドはsession_helper内に記載
  before_action :logged_in_user, only: [:index, :edit, :update]

  def nomal
    @title = Title.where(user_id: 1)
  end

  def index
    @title = current_user.titles.page(params[:page]).includes(:texts).per(14)
  end

  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)

    if @title.save
        flash[:success] = "#{@title.title}を作成しました"
        redirect_to titles_path
    else
      render :new
    end
  end

  def edit
    @title = current_user.titles.includes(:texts).find(params[:id])
  end

  def update
    @title = current_user.titles.includes(:texts).find(params[:id])
    if @title.update(title_params)
      redirect_to titles_path
      flash[:success] = "#{@title.title}を更新しました"
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
    params.require(:title).permit(:title, texts_attributes: [:id, :sentence, :_destroy]).merge(user_id: current_user.id)
  end
