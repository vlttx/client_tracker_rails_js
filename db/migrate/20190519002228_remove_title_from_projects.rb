class RemoveTitleFromProjects < ActiveRecord::Migration[5.2]
  def change
  	remove_column :projects, :title
  end
end
