class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def show
    @memories = @user.memories
    favorites = Favorite.where(user_id: current_user.id).pluck(:memory_id)
    @favorites = Memory.find(favorites)
    @district_count = @memories.distinct.pluck(:district_id).count
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
