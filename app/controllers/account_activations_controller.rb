class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "アカウントが認証されました!"
      redirect_to root_path
    else
      flash[:danger] = "無効なリンクです"
      redirect_to root_url
    end
  end
end
