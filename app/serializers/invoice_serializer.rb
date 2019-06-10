class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :amount, :service, :total, :rate, :created_at, :updated_at
end
