class CreateJoinTableManagerSubject < ActiveRecord::Migration[6.0]
  def change
    create_join_table :managers, :subjects do |t|
       t.index [:manager_id, :subject_id]
       t.index [:subject_id, :manager_id], unique: true
    end
  end
end
