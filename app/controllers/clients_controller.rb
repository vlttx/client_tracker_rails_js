class ClientsController < ApplicationController
	# before_action :set_user


	def index
		@clients = current_user.clients

	end

	def new
		@client = Client.new
	end


	def show
		@client = Client.find(params[:id])
	end

	
	def edit
		@client = current_user.clients.find_by_id(params[:id])
		if @client.update(params.permit(:business_name, :address, :email, :website))
      	redirect_to edit_client_path(@client)
     else 
      flash[:error] = "Client not found."
    end
	end

	def create
		@client = Client.new(client_params)
		@client.user = current_user
		@client.save
		redirect_to client_path(@client)
	end

	# def update
	# 	@client = Client.find(params[:id])
	# 	@client.update(client_params)
	# 	redirect_to client_path(@client)
	# end

	 def update 
    	if @client.update(client_params)
      	redirect_to clients_path
     else 
      set_client
      render :edit
    end
  end

	 def destroy
	 	@client = current_user.clients.find_by(id: params[:id])
    	if @client.nil? 
      	flash[:error] = "Client not found."
      	redirect_to clients_path
      else
      	@client.destroy
    end
  end

	private

	def client_params
		params.require(:client).permit(:business_name, :address, :email, :website)
	end

	def set_client
    @client = current_user.clients.find_by(id: params[:id])
    if @client.nil? 
      flash[:error] = "Client not found."
      redirect_to clients_path
    end
  end

	# def set_user
	# 	if current_user
	# 		@user = current_user
	# 	else
	# 		redirect_to new_user_registration
	# 	end
	# end


end
