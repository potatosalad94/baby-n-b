class BabiesController < ApplicationController
  def index
    @babies = Baby.all
  end

  def show
    @baby = Baby.find(params[:id])
  end

  def new
    @baby = Baby.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def baby_params
    params.require(:baby).permit(:name, :age, :description, :address, :city, )
  end
end
