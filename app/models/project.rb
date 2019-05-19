class Project < ApplicationRecord
	belongs_to :client
	has_many :invoices
	has_many :users, :through => :invoices
	validates :type, presence: true
end
