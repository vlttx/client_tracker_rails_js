class AddWebsiteToProjects < ActiveRecord::Migration[5.2]
  def change
  	add_column :projects, :website, :string
  end
end
