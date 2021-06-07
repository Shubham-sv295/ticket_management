class AddManagerId < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :manager_id_id, :string
  end
end
