class AddProjectidToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :project_id, :integer
  end
end
