class ClientsController < ApplicationController
	before_action :current_user
	
	def index
 			@clients = current_user.clients.order! 'created_at DESC'
 			respond_to do |format|
 			format.html {render :index}
 			format.json {render json: @clients}
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

	def create
		@client = current_user.clients.build(client_params)
		if @client.save
			render :show
			# render json: @client
			# respond_to do |format|
			# format.json {render json: @client}
		# end
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
		params.fetch(:client, {}).permit(:business_name, :address, :email, :website, project_ids: [])
	end


	def set_client
		@client = Client.find_by(id: params[:id])
		if !@client
			redirect_to clients_path
		end
	end


end

