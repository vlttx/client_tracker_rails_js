class User < ApplicationRecord
	has_many :invoices
	has_many :clients, through: :invoices
	has_many :projects, through: :clients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    validates :name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
