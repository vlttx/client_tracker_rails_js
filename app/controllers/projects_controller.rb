class ProjectsController < ApplicationController

	def new
		# check if nested and its a proper id
		if params[:client_id] && @client = Client.find_by_id(params[:client_id].to_i)
		@project = Project.new(client_id: params[:client_id].to_i)
		else
		#unnested
		@project = Project.new
	end
	end

	
	def index
		if params[:client_id]
			@client = Client.find_by_id(params[:client_id].to_i)
			@projects = @client.projects
		else
		@projects = current_user.projects
	end
	end

	def edit
		set_project
	end

	def show
		@project = Project.find(params[:id])
	end

	def update 
	 	set_project
    	if @project.update(project_params)
      	redirect_to projects_path
     else 
      set_project
      render :edit
    end
  end

	def create
		@project = current_user.projects.build(project_params)
		if @project.save
			redirect_to project_path(@project)
			else
			render :new
		end
			end

		#  redirect_to user_projects_path
		# @project = Project.new(project_params)
		# @project.client_id = @client.id
		# @project.save
		# redirect_to client_projects_path


		# @client = Client.new(client_params)
		# @client.user = current_user
		# @client.save
		# redirect_to client_path(@client)
		# current_user.clients.build(client_params)
		# if @client.save
		# redirect_to client_path(@client)
		# else
		# render :new
		# @client.user_id = current_user.id equals @client.user = current user



	private

	def project_params
		params.require(:project).permit(:description, :client_id)
	end

	def set_project
		@project = Project.find_by(id: params[:id].to_i)
	end
end


# def update 
# 	 	set_client
#     	if @client.update(client_params)
#       	redirect_to clients_path
#      else 
#       set_client
#       render :edit
#     end
#   end

# 	 def destroy
# 	 	set_client
# 	 	@client.destroy
# 	 	redirect_to clients_path