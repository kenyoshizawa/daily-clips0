class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    binding.pry

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to(login_url)
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render 'users/new'
    end
  end

  def edit
  end

  def update
    @current_user = User.find(params[:id])
    if current_user == @current_user
      if @current_user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to(root_url)
      else
        # flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render 'users/edit'
      end
    else
      redirect_to(root_url)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :image)
  end
end
