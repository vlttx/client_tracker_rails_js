class ClientSerializer < ActiveModel::Serializer
  attributes :id, :business_name, :email, :address, :website, :projects
  belongs_to :user
  has_many :projects
  has_many :invoices
end
