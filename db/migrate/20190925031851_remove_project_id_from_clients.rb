class RemoveProjectIdFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :project_id, :integer
  end
end
