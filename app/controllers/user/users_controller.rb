class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @memories = @user.memories
    
    favorites = Favorite.where(user_id: current_user.id).pluck(:memory_id)
    @favorite_list = Memory.find(favorites)
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdrawal
  end
end
