class AddProjectidToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :project_id, :integer
  end
end
