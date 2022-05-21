class User::DistrictsController < ApplicationController
  def index

  end

  def show
    @district = District.find(params[:id])
    @memories = @district.memories.where(params[:id])
  end

  private
  def district_params
    params.require(:district).permit(:memory_id, :name)
  end
end
