class Managers::HomeController < ApplicationController
  def index
    @tickets = current_user.assign_tickets
    @all_assigned_tickets = @tickets.count
    @resolved_by_manager_tickets_count = @tickets.where(status: 1).where.not(resolved_by_manager_at: nil).count
    @unresolved_tickets_count = @tickets.where(resolved_by_manager_at: nil).count
    @complete_tickets_count = @tickets.completed.count
  end

  def profile
    @path = "/managers/edit_profile"

  end
  
  def edit_profile 
    @path = "/managers/update_profile"
 
  end

  def update_profile
    if current_user.update(user_params)
      redirect_to managers_profile_path
    else
      render :edit_profile
    end
  end

  def create_comment
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to manager_ticket_path(@comment.ticket.id)
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :mob_no, :avatar, :content)
    end

    def comment_params
      params.require(:comment).permit(:ticket_id, :content)
    end
end
