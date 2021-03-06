class AddFurtherDetailsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mob_no, :string
    add_column :users, :role, :integer, default:0
    add_column :users, :provider, :string, limit: 50, null: false, default: ''
    add_column :users, :uid, :string, limit: 500, null: false, default: ''
  end
end

