class User::MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end

  def create
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
