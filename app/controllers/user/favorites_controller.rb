class User::FavoritesController < ApplicationController
  before_action :set_memory
  before_action :authenticate_user!

  def index
  end

  def create
    if @memory.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, memory_id: @memory.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, memory_id: @memory.id)
    @favorite.destroy
  end

  private
  def set_memory
    @memory = Memory.find(params[:memory_id])
  end
end
