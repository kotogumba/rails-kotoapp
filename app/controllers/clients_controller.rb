class ClientsController < ApplicationController
  def index
    if params[:query].present?
      @clients = Client.search(params[:query])
    else
      @clients = Client.all
    end
  end

  def client_photos
    @client = Client.find(params[:id])
    @photos = @client.photos
  end

  def upload
    @client = Client.find(params[:id])
    render :upload
    @client.photos.attach(params[:photos])
  end

  def show
    @client = Client.find(params[:id])
    @services = @client.services
    # services grouped by day and sorted by time
    @grouped_services = @services.group_by { |service| service.created_at.to_date }.sort_by { |date, _| date }.reverse
  
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone, :age, :comments, :avatar, photos: [])
  end

end
