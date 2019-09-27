module ProjectsHelper
	def sort(projects)
	    projects.order! 'created_at DESC'
	end

	def created_date(project)
		project.created_at.strftime("%b %e, %Y")
	end

end
