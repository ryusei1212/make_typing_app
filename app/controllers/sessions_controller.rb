class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or root_path
      else
        flash[:warning] = "メールアドレスの本人確認が必要です"
        redirect_to login_path
      end
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが正しくありません'
      render 'new'
    end
  end

  def create_google
    if(user = User.find_or_create_auth_hash(auth_hash))
      user.activate
      flash[:success] = 'ログイン'
      log_in user
    end
    redirect_to root_path
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
    def auth_hash
      request.env['omniauth.auth']
    end
end
