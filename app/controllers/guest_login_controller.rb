class GuestLoginController < ApplicationController
  def create
    user = User.find_or_create_by(email: 'guest@example.com')
    user.name = 'guest'
    user.password = SecureRandom.base64(10)
    user.activated = true
    user.save!
    session[:user_id] = user.id
    flash[:success] = 'ゲストユーザとしてログインしました'
    redirect_to root_path
  end
end
