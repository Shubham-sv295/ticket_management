class Managers::TicketsController < ApplicationController
  def index
    @tickets = current_user.assign_tickets
    @heading = "All Tickets"
    if params[:type] == "resolved_by_manager"
      @tickets = @tickets.where(status: 1).where.not(resolved_by_manager_at: nil)
      @heading = "Waiting for Customer Response"
    elsif params[:type] == 'unresolved'
      @tickets = @tickets.where(resolved_by_manager_at: nil)
      @heading = "Unsolved Tickets"
    elsif params[:type] == 'completed'
      @tickets = @tickets.completed
      @heading = "Solved Tickets"
    end
  end

  def show
    @ticket = current_user.assign_tickets.find_by(id: params[:id])
    $last_comment_author
    $last_comment_date
  end

  def resolved_by_manager
    @ticket = current_user.assign_tickets.find_by(id: params[:id])
    byebug
    @ticket.resolved_by_manager_at = Time.new;
    if @ticket.save
      redirect_to managers_home_index_path
    else
      render resolved_by_manager
    end
  end

  def create_comment
    @comment = current_user.comments.new(comment_params)
    byebug
    if @comment.save
      respond_to do |format|
        format.html { redirect_to managers_ticket_path(@comment.ticket.id), notice: 'Comment was successfully created.' }
        format.js
      end
    else
      format.html {render action: "new_comment"}
      format.js  
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:ticket_id, :content)
  end
  
end
