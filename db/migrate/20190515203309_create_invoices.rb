class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :service
      t.integer :quantity
      t.integer :amount
      t.integer :total
      t.string :rate
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
