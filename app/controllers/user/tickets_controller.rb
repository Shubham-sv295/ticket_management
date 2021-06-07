class User::TicketsController < ApplicationController
  def index
    @tickets = current_user.tickets
    @heading = "All Tickets"
    if params[:type] == "in_process"
      @tickets = @tickets.inprogress
      @heading = "Tickets Inprogress"
    elsif params[:type] == 'pending'
      @tickets= @tickets.pending
      @heading = "Pending Tickets"
    elsif params[:type] == 'completed'
      @tickets = @tickets.completed
      @heading = "Solved Tickets"
    elsif params[:type] == 'resolved_by_manager'
      @tickets = @tickets.inprogress.where.not(resolved_by_manager_at: nil)
      @heading = "Solved By Manager"
    end
  end

  def new
    @ticket=Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      message = "Hi Mr. #{@ticket.user.name} You have successfully Register your problem \n We are working on it and resolve it soon. \n Your token_id is : #{@ticket.ticket_no} \n Thanks regards. \n Ticket Management"
      UserMailer.with(ticket: @ticket).ticket_generated.deliver
      # TwilioTextMessenger.new(message, @ticket.user.mob_no).call
      # TwilioTextMessenger.new(message, @ticket.user.mob_no).phone_call
      redirect_to user_ticket_path(@ticket.id)
    else
      render :new
    end
  end

  def edit
    @ticket=current_user.tickets.find_by(id: params[:id])
  end

  def update
    @ticket=current_user.tickets.find_by(id: params[:id])
    if @ticket.update(ticket_params)
      redirect_to user_ticket_path(@ticket.id)
    else
      render :edit
    end
  end

  def show
    @ticket = current_user.tickets.find_by(id: params[:id])
    $last_comment_author
    $last_comment_date
  end

  def destroy
    @ticket = current_user.tickets.find_by(id: params[:id])
    @ticket.destroy
    redirect_to user_tickets_path 
  end

  def new_comment
  end 

  def create_comment
    byebug
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_ticket_path(@comment.ticket.id), notice: 'Comment was successfully created.' }
        format.js
      end
    else
      format.html {render action: "new_comment"}
      format.js  
    end
  end

  def solved_by_user
    @ticket = current_user.tickets.find_by(id: params[:id])
    @ticket.status = 2;
    if @ticket.save
      redirect_to user_ticket_path(@ticket.id)
    end
  end

  def ticket_params
    params.require(:ticket).permit(:description, :subject_id,:ticket_no, :user_id)
  end

  def comment_params
      params.require(:comment).permit(:ticket_id, :content)
  end
  
end
