class User < ApplicationRecord
	has_many :invoices
	has_many :clients, through: :invoices
	has_many :projects, through: :clients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
