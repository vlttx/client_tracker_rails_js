class AddClientIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :client_id, :integer
  end
end
