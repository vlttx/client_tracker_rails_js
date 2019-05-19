class AddClientidToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :client_id, :integer
  end
end
