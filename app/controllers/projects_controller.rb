class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	
	def index
		@projects = current_user.projects
	end

	def show
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new
		@project.type = params[:type]
		@project.title = params[:title]
		@projects.deadline = params[:deadline]
		@project.save

	end

	

end
