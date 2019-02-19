class BabiesController < ApplicationController
  def index
    @babies = policy_scope(Baby).order(created_at: :desc)
    # @babies = Baby.all
  end

  def show
    @baby = Baby.find(params[:id])
    authorize @baby
  end

  def new
    @baby = Baby.new
    authorize @baby
  end

  def create
    @baby = Baby.new(baby_params)
    authorize @baby
    if @baby.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    @baby = Baby.find(params[:id])
    @baby.update(baby_params)
    redirect_to baby_path(@baby)
  end

  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy
    redirect_to baby_path(@baby)
  end

  def search
    # @babies = Baby.where(city: params[:query][:city])
    @babies = Baby.where("city ILIKE ?", "%#{params[:query][:city]}%")
    authorize @babies
  end

  private

  def baby_params
    params.require(:baby).permit(:name, :age, :description, :address, :city, :price, :photo)
  end
end
