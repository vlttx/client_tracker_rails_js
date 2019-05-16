class Client < ApplicationRecord
	has_many :invoices
	has_many :projects
	has_many :users, :through => :invoices
end
