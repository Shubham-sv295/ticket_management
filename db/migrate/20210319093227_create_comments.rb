class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :author, class_name: "User"
      t.belongs_to :ticket
      t.timestamps
    end
  end
end
