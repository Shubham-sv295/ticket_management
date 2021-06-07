class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :ticket_no
      t.string  :description
      t.belongs_to  :user
      t.belongs_to  :manager
      t.boolean :seen_by_manager, default:false
      t.integer  :status, default:0
      t.belongs_to  :subject
      t.timestamps
    end
 end
end
