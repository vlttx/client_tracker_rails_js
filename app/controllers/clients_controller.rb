class ClientsController < ApplicationController
	
	def index
		@clients = current_user.clients

	end

	def new
		@client = Client.new
		@project = @client.projects.build #making it available for the nested form
	end


	def show
		set_client
		@project = @client.projects.build #making it available for the nested form
	end

	
	def edit
		set_client
	end

	def create
		byebug
		@client = Client.new(client_params)
		@client.user = current_user
		if @client.save
				redirect_to client_path(@client)
		elsif 
			@client.projects.build
			render :new
		else
			redirect_to new_client_path
		end
	end

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
  	end

	private

	def client_params
		params.require(:client).permit(:business_name, :address, :email, :website, project_attributes: [])
	end


	def set_client
	@client = Client.find_by(id: params[:id])
		if !@client
			redirect_to clients_path
	end
	end


end


# def set_client
 #    @client = current_user.clients.find_by(id: params[:id])
 #    if @client.nil? 
 #      flash[:error] = "Client not found."
 #      redirect_to clients_path
 #    end
 #  end
