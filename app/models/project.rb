class Project < ApplicationRecord
	belongs_to :client
	has_many :users, :through => :invoices
end
