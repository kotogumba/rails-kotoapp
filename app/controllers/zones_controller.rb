class ZonesController < ApplicationController
  def index
    @zones = Zone.all
  end

  def show
    @zone = Zone.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @zone }
    end
  end

  def medicines
    @zone = Zone.find(params[:id])
    @medicines = @zone.medicines
    respond_to do |format|
      format.html
      format.json { render json: @medicines }
    end
  end

  def new
    @zone = Zone.new
  end

  def create
    @zone = Zone.new(zone_params)
    if @zone.save
      redirect_to @zone
    else
      render :new
    end
  end

  def edit
    @zone = Zone.find(params[:id])
  end

  def update
    @zone = Zone.find(params[:id])
    @zone.medicines << Medicine.find(params[:zone][:medicines])
    if @zone.update(zone_params)
      redirect_to @zone
    else
      render :edit
    end
  end

  def destroy
    @zone = Zone.find(params[:id])
    @zone.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def zone_params
    params.require(:zone).permit(:title, :description)
  end
end
