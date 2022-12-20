class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :client_photos, :upload]

  def index
    if params[:query].present?
      @clients = Client.search(params[:query])
    else
      @clients = Client.all
    end
  end

  def client_photos
    @photos = @client.photos
  end

  def upload
    render :upload
    @client.photos.attach(params[:photos])
  end

  def show
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
  end

  def update
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone, :age, :comments, photos: [])
  end

end
