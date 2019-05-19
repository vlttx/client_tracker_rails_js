class Project < ApplicationRecord
	has_many :clients
	has_many :users, :through => :clients
end
