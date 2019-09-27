class ProjectsController < ApplicationController
	before_action :current_user

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
			@projects = @client.projects.order! 'created_at DESC'
		else
		@projects = current_user.projects.order! 'created_at DESC'
		respond_to do |format|
 			format.html {render :index}
 			format.json {render json: @projects}
 		end
	end
	end

	def edit
		set_project
	end

	def show
		@project = Project.find(params[:id].to_i)
		@client = Client.find(@project.client_id)
		respond_to do |format|
			format.html {render:show}
			format.json {render json: @project}
		end
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

	def destroy
	 	set_project
	 	@project.destroy
	 	redirect_to projects_path
  	end

	private

	def project_params
		params.require(:project).permit(:description, :client_id, invoice_ids: [])
	end

	def set_project
		@project = Project.find_by(id: params[:id].to_i)
	end
end
