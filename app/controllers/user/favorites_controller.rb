class User::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @memory = Memory.find(params[:memory_id])
    favorite = @memory.favorites.new(user_id: current_user.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @memory = Memory.find(params[:memory_id])
    favorite = @memory.favorites.find_by(user_id: current_user.id)
    if favorite.present?
      favorite.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
