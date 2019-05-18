class AddWebsiteToClients < ActiveRecord::Migration[5.2]
  def change
  	add_column :clients, :website, :string
  end
end
