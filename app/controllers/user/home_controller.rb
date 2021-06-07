class User::HomeController < ApplicationController
	before_action :set_user ,except: :index
  def index
    @tickets = current_user.tickets
    @last_ticket = @tickets.last
    @all_ticket_count = @tickets.count
    @pending_ticket_count = @tickets.pending.count
    @open_ticket_count = @tickets.inprogress.count
    @closed_ticket_count = @tickets.completed.count
    @resolved_by_manager = @tickets.inprogress.where.not(resolved_by_manager_at: nil).count
  end

  def profile
    @path = "/user/edit_profile"
  end
    
  def edit_profile
    @path = "/user/update_profile"
  end
  
  def update_profile
    byebug
    if current_user.update(user_params)
      redirect_to user_profile_path
    else
      render :edit_profile
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :mob_no, :avatar, :content)
    end

    def comment_params
      params.require(:comment).permit(:ticket_id, :content)
    end
  def set_user
    @user=current_user
  end
end
