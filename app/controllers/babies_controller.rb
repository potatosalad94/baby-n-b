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
    @baby.user = current_user
    authorize @baby
    if @baby.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def edit
    @baby = Baby.find(params[:id])
    authorize @baby
  end

  def update
    @baby = Baby.find(params[:id])
    authorize @baby
    @baby.update(baby_params)
    redirect_to baby_path(@baby)
  end

  def destroy
    @baby = Baby.find(params[:id])
    authorize @baby
    @baby.destroy
    redirect_to :root
  end

  def search

    if params[:query][:city].empty? && params[:query][:age].empty? && params[:query][:price].empty?

      @babies = Baby.all
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

    elsif params[:query][:city].present? && params[:query][:age].empty? && params[:query][:price].empty?
      @babies = Baby.where('city ILIKE ?', params[:query][:city])
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

    elsif params[:query][:city].present? && params[:query][:age].present? && params[:query][:price].empty?
      @babies = Baby.where('city ILIKE ? AND age <= ?', params[:query][:city], params[:query][:age])

      # @babies = Baby.where('city = ? AND age = ? AND price = ?', params[:query][:city], params[:query][:age], params[:query][:price])
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

    elsif params[:query][:city].present? && params[:query][:age].present? && params[:query][:price].present?
      @babies = Baby.where('city ILIKE ? AND age <= ? AND price <= ?', params[:query][:city], params[:query][:age], params[:query][:price])

      # @babies = Baby.where('city = ? AND age = ? AND price = ?', params[:query][:city], params[:query][:age], params[:query][:price])
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

    elsif params[:query][:city].empty? && params[:query][:age].present? && params[:query][:price].empty?
      @babies = Baby.where('age <= ?', params[:query][:age])

      # @babies = Baby.where('city = ? AND age = ? AND price = ?', params[:query][:city], params[:query][:age], params[:query][:price])
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

    elsif params[:query][:city].empty? && params[:query][:age].empty? && params[:query][:price].present?
      @babies = Baby.where('price <= ?', params[:query][:price])

      # @babies = Baby.where('city = ? AND age = ? AND price = ?', params[:query][:city], params[:query][:age], params[:query][:price])
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

    elsif params[:query][:city].present? && params[:query][:age].empty? && params[:query][:price].present?
      @babies = Baby.where('city ILIKE ? AND price <= ?', params[:query][:city], params[:query][:price])

      # @babies = Baby.where('city = ? AND age = ? AND price = ?', params[:query][:city], params[:query][:age], params[:query][:price])
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

      elsif params[:query][:city].empty? && params[:query][:age].present? && params[:query][:price].present?
      @babies = Baby.where('age <= ? AND price <= ?', params[:query][:age], params[:query][:price])

      # @babies = Baby.where('city = ? AND age = ? AND price = ?', params[:query][:city], params[:query][:age], params[:query][:price])
      authorize @babies
      @babies_map = @babies.where.not(latitude: nil, longitude: nil)
      @availablebabies = @babies + @babies_map

      @markers = @availablebabies.map do |baby|
        {
          lng: baby.longitude,
          lat: baby.latitude
        }
      end

    end
  end

  private

  def baby_params
    params.require(:baby).permit(:name, :age, :description, :address, :city, :price, :photo)
  end
end
