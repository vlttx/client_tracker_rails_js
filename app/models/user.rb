class User < ApplicationRecord
  has_secure_password
	has_many :clients
	has_many :invoices
	has_many :projects, through: :clients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
  	devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,10]
      end
    end
end
