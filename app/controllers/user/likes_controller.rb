class User::LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @memory = Memory.find(params[:memory_id])
    like = current_user.likes.new(memory_id: @memory.id) 
    like.save
  end

  def destroy
    @memory = Memory.find(params[:memory_id])
    like = current_user.likes.find_by(memory_id: @memory.id) 
    like.destroy
  end
end
