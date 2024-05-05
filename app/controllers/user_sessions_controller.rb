class UserSessionsController < ApplicationController

  def new; end

  def create
    @user = login(params[:email], params[:password])
    Rails.logger.debug("Login result: #{@user.inspect}")
    if @user
      flash[:notice] = 'ログインしました'
      redirect_back_or_to root_path
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path, status: :see_other
  end
end
