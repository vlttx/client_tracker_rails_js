class RemoveQuantityFromInvoices < ActiveRecord::Migration[5.2]
  def change
  	remove_column :invoices, :quantity
  end
end
