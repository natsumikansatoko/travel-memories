class User::LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :memory_params, only: [:create, :destroy]

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

  private
  def memory_params
    @memory = Memory.find(params[:memory_id])
  end
end