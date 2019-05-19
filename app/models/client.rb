class Client < ApplicationRecord
	belongs_to :user
	has_many :projects
	has_many :invoices, through: :projects
	validates :business_name, :email, :website, :address, presence: true
end
