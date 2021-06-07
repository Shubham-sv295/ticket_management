class Admin::TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :js, :html, :json
  def index
    @tickets = Ticket.all
    @heading = "All Tickets"
    if params[:type] == "pending"
      @tickets = @tickets.pending
      @heading = "Pending Tickets"
    elsif params[:type] == "inprogress"
      @tickets = @tickets.inprogress
      @heading = "Tickets Inprogress"
    elsif params[:type] == 'completed'
      @tickets = @tickets.completed
      @heading = "Solved Tickets"
    end
  end
  def assign_manager
    @ticket = Ticket.find_by(id: params[:id])
  end

  def update
    @ticket = Ticket.find_by(id: params[:id])
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket.id)
    else
      render :assign_manager
    end 
  end

  def show
    @ticket = Ticket.find_by(id: params[:id])
    $ticket = @ticket
    $last_comment_date
    $last_comment_author
  end

  def new_comment

  end
  
  def create_comment
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to admin_ticket_path(@comment.ticket.id), notice: 'Comment was successfully created.' }
        format.js
      end
    else
      format.html {render action: "new_comment"}
      format.js  
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :subject_id,:ticket_no, :user_id, :manager_id, :status)
  end

  def comment_params
      params.require(:comment).permit(:ticket_id, :content)
  end
end
