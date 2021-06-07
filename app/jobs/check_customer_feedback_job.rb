class CheckCustomerFeedbackJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    puts "Job is running again"
    @comment = ticket.comments.where(created_at: 24.hours.ago..Time.now).last
    if !@comment.blank? && @comment.author.customer?
        ticket.status = 2
        if ticket.save
          puts "status changed #{@comment.content} status #{ticket.status}"
        end
    end
  end
end
