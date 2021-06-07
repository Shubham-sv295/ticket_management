class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :ticket
  after_create :send_notification

  def send_notification
    @ticket = self.ticket
    if self.author.customer? && @ticket.manager.present?
      message = "Hi Mr. #{@ticket.manager.name} \n Mr.#{@ticket.user.name} Commented on Ticket_no. #{@ticket.ticket_no} \n '#{self.content}' \n Thanks regards."
      TwilioTextMessenger.new(message, @ticket.manager.mob_no).call
      UserMailer.with(comment: self, receiver: @ticket.manager.email).notification_of_comment.deliver
    elsif self.author.manager?
      message = "Hi Mr. #{@ticket.user.name} \n Your Ticket no #{@ticket.ticket_no} has new comments by \n Manager Mr. #{@ticket.manager.name} \n '#{self.content}' \n Thanks regards."
      TwilioTextMessenger.new(message, @ticket.user.mob_no).call
      UserMailer.with(comment: self, receiver: @ticket.user.email).notification_of_comment.deliver
    elsif self.author.admin?
      if @ticket.manager.present?
        message = "Hi Mr. #{@ticket.manager.name} \n Admin Mr#{self.author.name} Commented on Ticket_no. #{@ticket.ticket_no} \n '#{self.content}' \n Thanks regards."
        TwilioTextMessenger.new(message, @ticket.manager.mob_no).call
        UserMailer.with(comment: self, receiver: @ticket.manager.email).notification_of_comment.deliver
      end
      message = "Hi Mr. #{@ticket.user.name} \n Your Ticket no #{@ticket.ticket_no} has new comments by \n Admin Mr. #{self.author.name} \n '#{self.content}' \n Thanks regards."
      TwilioTextMessenger.new(message, @ticket.user.mob_no).call
      UserMailer.with(comment: self, receiver: @ticket.user.email).notification_of_comment.deliver
    end
  end
end
