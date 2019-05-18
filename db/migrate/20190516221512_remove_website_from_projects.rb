class RemoveWebsiteFromProjects < ActiveRecord::Migration[5.2]
  def change
  	remove_column :projects, :website
  end
end
