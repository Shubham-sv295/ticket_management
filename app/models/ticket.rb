class Ticket < ApplicationRecord
  
  belongs_to :manager, class_name: "User", foreign_key: "manager_id", optional: :true
  belongs_to :user, foreign_key: "user_id", optional: :true
  belongs_to :subject
  has_many :comments
  before_create :generate_ticket_no
  after_update :assign_manager_mail, if: :saved_change_to_manager_id?
  enum status: [:pending, :inprogress, :completed]
  def generate_ticket_no
  	self.ticket_no = rand(1111111..9999999)
  end 

  def assign_manager_mail
    UserMailer.with(ticket: self).assign_manager_email.deliver
    message = "Hi Mr. #{self.user.name} \n We have assign a manager to Your Problem \n Manager name : #{self.manager.name}\n He will contact you soon \n Thanks regards."
    TwilioTextMessenger.new(message, self.user.mob_no).call
    message = "Hi Mr. #{self.manager.name} \n We have a assigned a new problem to you on the basis of duties that you handle. \n Customer name : #{self.user.name} \n Problem description : #{self.description} \n pls solve it as soon as possible \n Thanks regards."
    TwilioTextMessenger.new(message, self.manager.mob_no).call
    UserMailer.with(ticket: self).assign_problem_to_manager_email.deliver
  end
end