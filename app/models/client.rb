class Client < ApplicationRecord
	belongs_to :user
	has_many :projects
	has_many :invoices, through: :projects
	validates_presence_of :business_name
	validates_uniqueness_of :business_name


	def project_attributes=(atts)
		if atts[:description] != ""
			project = self.projects.find_or_create_by(atts)
			if project.valid?
				self.projects << project
			end
		end
	end


	# def project_attributes=(atts)
	# 	atts.values.each do |v|
	# 		project = Project.find_or_create_by(v)
	# 		self.projects <<project
	# 	end
	# end


	
end
