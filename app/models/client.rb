class Client < ApplicationRecord
	belongs_to :user
	has_many :projects
	has_many :invoices, through: :projects
	validates :business_name, :email, :website, :address, presence: true
	# accepts_nested_attributes_for :project


	# def project_attributes=(atts)
	# 	if atts[:description] != ""
	# 		self.project = self.user.projects.find_or_createby(atts)
	# 	end
	# end


	
end
