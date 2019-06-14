class ClientSerializer < ActiveModel::Serializer
  attributes :id, :business_name, :email, :address, :website
  belongs_to :user
  has_many :projects
  has_many :invoices
end
