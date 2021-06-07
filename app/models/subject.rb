class Subject < ApplicationRecord
  has_and_belongs_to_many :managers, class_name: "User", association_foreign_key: "manager_id", join_table: "managers_subjects"
  attr_accessor :manager

end