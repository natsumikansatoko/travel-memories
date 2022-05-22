class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @memories = @user.memories
    favorites = Favorite.where(user_id: current_user.id).pluck(:memory_id)
    @favorites = Memory.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :is_active)
  end
end
