class ClientsController < ApplicationController
	def index
		@clients = current_user.clients
	end

	def show
		@client = Client.find(params[:id])
	end

	def create
		@client = Client.new(client_params)
		@client.save
		redirect_to client_path(@client)
	end

	def new
		@client = Client.new
	end

	def update
		@client = Client.find(params[:id])
		@client.update(client_params)
		redirect_to client_path(@client)
	end

	private

	def client_params
		params.require(:client).permit!
	end


end
