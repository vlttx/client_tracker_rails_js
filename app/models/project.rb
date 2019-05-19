class Project < ApplicationRecord
	has_many :clients
	has_many :users, :through => :clients
	validates :type, presence: true
end
