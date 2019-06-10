class ClientSerializer < ActiveModel::Serializer
  attributes :idm :business_name, :email, :address, :website
  has_many :projects
  has_many :invoices
end
