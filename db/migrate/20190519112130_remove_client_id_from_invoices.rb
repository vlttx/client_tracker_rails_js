class RemoveClientIdFromInvoices < ActiveRecord::Migration[5.2]
  def change
  	remove_column :invoices, :client_id
  end
end
