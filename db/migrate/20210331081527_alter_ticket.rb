class AlterTicket < ActiveRecord::Migration[6.0]
  def up
    remove_column :tickets, :seen_by_manager
    add_column :tickets, :resolved_by_manager_at, :timestamp
  end

  def down
    add_column :tickets, :seen_by_manager, :boolean
    remove_column :tickets, :resolved_by_manager_at
  end
end
