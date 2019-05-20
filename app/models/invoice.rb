class Invoice < ApplicationRecord
	belongs_to :user
	belongs_to :project, optional: true



	# def project_attributes=(atts)
	# 	if atts[:description] != ""
	# 		self.project = self.user.projects.find_or_createby(atts)
	# 	end
	# end
end
