class ClientsController < ApplicationController
	# before_action :set_user


	def index
		@clients = current_user.clients

	end

	def new
		@client = Client.new
	end


	def show
		set_client
		# @client = Client.find(params[:id])
	end

	
	def edit
		set_client
		# redirect_to clients_path
		# @client = current_user.clients.find_by_id(params[:id])
		# if @client.update(params.permit(:business_name, :address, :email, :website))
  #     	redirect_to edit_client_path(@client)
  #    else 
  #     flash[:error] = "Client not found."
  #   end
	end

	def create
		@client = Client.new(client_params)
		@client.user = current_user
		@client.save
		redirect_to client_path(@client)
		# current_user.clients.build(client_params)
		# if @client.save
		# redirect_to client_path(@client)
		# else
		# render :new
		# @client.user_id = current_user.id equals @client.user = current user
	end

	# def update
	# 	@client = Client.find(params[:id])
	# 	@client.update(client_params)
	# 	redirect_to client_path(@client)
	# end

	 def update 
	 	set_client
    	if @client.update(client_params)
      	redirect_to clients_path
     else 
      set_client
      render :edit
    end
  end

	 def destroy
	 	set_client
	 	@client.destroy
	 	redirect_to clients_path
	 	# @client = current_user.clients.find_by(id: params[:id])
   #  	if @client.nil? 
   #    	flash[:error] = "Client not found."
   #    	redirect_to clients_path
   #    else
   #    	@client.destroy
   #  end
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

	def set_client
	@client = Client.find_by(id: params[:id])
		if !@client
			redirect_to clients_path
	end
	end


end
