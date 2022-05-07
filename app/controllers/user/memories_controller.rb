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
      render 'index'
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def memory_params
    params.require(:memory).permit(:address, :district, :title, :body, :rate, :genre, :image)
  end
end
