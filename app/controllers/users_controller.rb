class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show

  end

  def edit
    if @user != current_user
      redirect_to current_user
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :profile, :profile_image)
    end

    def find_params
      @user = User.find(params[:id])
    end

end
