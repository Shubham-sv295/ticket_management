class UserMailer < ApplicationMailer
  def customer_welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome Mail')
  end

  def manager_welcome_email
    @manager = params[:user]
    mail(to: @manager.email, subject: 'Welcome Mail')
  end

  def ticket_generated
    @ticket = params[:ticket]
    mail(to: @ticket.user.email, subject: 'Confirmation')
  end

  def assign_manager_email
    @ticket = params[:ticket]
    mail(to: @ticket.user.email, subject: 'Manager Assigned')
  end

  def assign_subject_to_manager
    @manager = params[:manager]
    @subject = params[:subject]
    mail(to: @manager.email, subject: 'Assign some duties')
  end

  def assign_problem_to_manager_email
    @ticket = params[:ticket]
    mail(to: @ticket.manager.email, subject: 'Assign New Problem')
  end

  def notification_of_comment
    @comment = params[:comment]
    @ticket = @comment.ticket
    @receiver = params[:receiver]
    mail(to: @receiver, subject: 'Comment On Ticket')
  end

end
