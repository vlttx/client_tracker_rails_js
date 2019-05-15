class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :type
      t.string :name
      t.datetime :deadline

      t.timestamps
    end
  end
end
