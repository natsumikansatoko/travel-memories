class User::MemoriesController < ApplicationController
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
  end

  def show
    @memory = Memory.find(params[:id])
    
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

  private
  def memory_params
    params.require(:memory).permit(:latitude, :longitude, :address, :district_id, :title, :body, :rate, :genre_id, memory_images_images: [])
  end
end
