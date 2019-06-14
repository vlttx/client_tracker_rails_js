class ClientsController < ApplicationController
	before_action :current_user
	
	def index
		if params[:business_name]
 		@client = Client.with_business_name(params[:business_name])
 		@client = @client.first
 		render :show
 	else
 		@clients = current_user.clients
 		respond_to do |format|
 			format.html {render :index}
 			format.json {render json: @clients}
 		end
 	end

	end

	def new
		@client = Client.new
	end


	def show
		set_client
		respond_to do |format|
			format.html {render:show}
			format.json {render json: @client}
		end
	end

	
	def edit
		set_client
	end

	# def create
	# 	@client = Client.new(client_params)
	# 	@client.user = current_user
	# 	if @client.save
	# 			redirect_to client_path(@client)
	# 	elsif 
	# 		@client.projects.build
	# 		render :new
	# 	else
	# 		redirect_to new_client_path
	# 	end
	# end

	def create
		@client = current_user.clients.build(client_params)
		if @client.save
			# respond_to do |f| 
			# format.html {render:show}
			# format.json {render json: @client}
			# end
		render json: @client
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
		params.require(:client).permit(:business_name, :address, :email, :website)
	end


	def set_client
		@client = Client.find_by(id: params[:id])
		if !@client
			redirect_to clients_path
		end
	end


end

