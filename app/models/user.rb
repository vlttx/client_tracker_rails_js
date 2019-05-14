class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true
	validates :email, uniqueness: true
	has_many :clients
	has_many :projects, through: :clients
end
