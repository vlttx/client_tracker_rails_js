class AddBusinessIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :business_id, :string
  end
end
