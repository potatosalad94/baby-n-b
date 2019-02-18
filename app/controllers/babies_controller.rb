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
    @baby = Baby.new(baby_params)
    if @baby.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def baby_params
    params.require(:baby).permit(:name, :age, :description, :address, :city, :price)
  end
end
