module ClientsHelper
	def set_project(project)
		client.project ||= Project.new
		client
	end
end
