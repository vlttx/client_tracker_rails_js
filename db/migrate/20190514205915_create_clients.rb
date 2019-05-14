class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :business_name
      t.string :address
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
