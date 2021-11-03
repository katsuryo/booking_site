class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    if current_user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to root_path
    else
      render :edit
    end
  end

  def profile
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :profile, :profile_image)
  end
end
