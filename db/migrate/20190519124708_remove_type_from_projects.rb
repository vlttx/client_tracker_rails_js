class RemoveTypeFromProjects < ActiveRecord::Migration[5.2]
  def change
  	remove_column :projects, :type
  end
end
