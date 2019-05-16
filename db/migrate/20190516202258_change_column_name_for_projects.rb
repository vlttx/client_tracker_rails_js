class ChangeColumnNameForProjects < ActiveRecord::Migration[5.2]
  def change
  	rename_column :projects, :name, :title
  end
end
