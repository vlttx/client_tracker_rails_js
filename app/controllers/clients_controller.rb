class ClientsController < ApplicationController
	# before_action :set_user


	def index
		@clients = current_user.clients

	end

	def show
		@client = Client.find(params[:id])
	end

	def new
		@client = Client.new
	end

	def create
		@user = current_user
		@client = @user.build(client_params)
		@client.save
		redirect_to client_path(@client)
		# @client = Client.new(client_params)
		# byebug
		# @client.user = current_user
		# @client.save
		# redirect_to client_path(@client)
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

	# def set_user
	# 	if current_user
	# 		@user = current_user
	# 	else
	# 		redirect_to new_user_registration
	# 	end
	# end


end
