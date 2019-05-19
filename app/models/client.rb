class Client < ApplicationRecord
	belongs_to :user
	belongs_to :project, optional: true
	validates :business_name, :email, :website, :address, presence: true
end
