class ProjectsController < ApplicationController

	def new
		
		@client = Client.find(params[:client_id])
		@project = Project.new
		@project.client_id = @client.id

	end

	
	def index
		byebug
		@projects = current_user.projects
	end

	def show
		@project = Project.find(params[:id])
	end

	def create
		
		@project = Project.new(project_params)
		@project.client_id = @client.id
		@project.save
		redirect_to projects_path


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

	private

	def project_params
		params.require(:project).permit(:description)
	end

end
