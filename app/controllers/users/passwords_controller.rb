class Users::PasswordsController < Devise::PasswordsController
  before_action :check_guest, only: :create
#ゲストログイン機能
  def check_guest
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end
end
#ゲストログイン機能

