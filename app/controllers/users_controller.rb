class UsersController < ApplicationController
  before_action :find_user

  def index
    @users = User.all
  end

  def show
    
  end

  def edit
    find_user
  end

  def update
    find_user
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

    def find_user
      @user = User.find(params[:id]) 
    end
    
  
  
end
