class Client < ApplicationRecord
	belongs_to :user
	has_many :invoices
	has_many :projects
end
