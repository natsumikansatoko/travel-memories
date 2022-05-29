class User::MemoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :cerate, :edit, :update, :destroy]
  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    @memory.user_id = current_user.id
    if @memory.save
      redirect_to memory_path(@memory)
    else
      @memories = Memory.all
      render 'new'
    end
  end

  def index
    @memories = Memory.all.page(params[:page]).per(5)
    @all_ranks = Memory.find(Like.group(:memory_id).order('count(memory_id) desc').limit(5).pluck(:memory_id))
  end

  def show
    @memory = Memory.find(params[:id])
    @user = current_user

  end

  def edit
    @memory = Memory.find(params[:id])
  end

  def update
    @memory = Memory.find(params[:id])
    if @memory.update(memory_params)
      redirect_to memory_path(@memory)
    else
      render :edit
    end
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to memories_path
  end

  def search
    @memories = Memory.search(params[:keyword])
  end

  private
  def memory_params
    params.require(:memory).permit(:latitude, :longitude, :address, :district_id, :title, :body, :rate, :genre_id, memory_images_images: [])
  end
end
