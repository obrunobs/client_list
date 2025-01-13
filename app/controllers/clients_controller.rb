class ClientsController < ApplicationController
  before_action :load_client, only: [ :show, :edit, :update ]
  def index
    @clients = Client.all
  end

  def show; end

  def edit; end
  def update
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :edit
    end
  end

  def new
    @client = Client.new
  end
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  private
  def client_params
    params.require(:client).permit(:name, :age, :function)
  end

  def load_client
    @client = Client.find(params[:id])
  end
end
