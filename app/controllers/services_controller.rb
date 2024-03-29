class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @service }
    end
  end

  def new
    @client_id = params[:client_id]
    @client = Client.find(@client_id)
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to client_path(@service.client_id)
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to @service
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def service_params
    params.require(:service).permit(:client_id, :doctor_id, :medicine_id, :zone_id, :title, :comment, :quantity)
  end
end
