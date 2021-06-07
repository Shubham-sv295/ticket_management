class Admin::HomeController < ApplicationController
  
  def index 
    @tickets =Ticket.all
    @last_ticket = @tickets.last
    @all_ticket_count = @tickets.count
    @pending_ticket_count = @tickets.pending.count
    @inpro_ticket_count = @tickets.inprogress.count
    @complete_ticket_count = @tickets.completed.count
    @registered_users = User.customer.all
    @all_managers = User.manager.all
    @all_subjects = Subject.all
  end

  def profile
    @path = "/admin/edit_profile"
  end
  
  def edit_profile
    @path = "/admin/update_profile"
  end

  def update_profile
    if current_user.update(user_params)
      redirect_to admin_profile_path
    else
      render :edit_profile
    end
  end

  def show_tickets
    @tickets = Ticket.all
    if params[:type] == "pending"
      @tickets=Ticket.pending
    elsif params[:type] == "inprogress"
      @tickets=Ticket.inprogress
    elsif params[:type].eql?('completed') 
      @tickets=Ticket.completed
    end
    @tickets
  end

  def show_all_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :mob_no, :avatar)
  end

  def subject_params
    params.require(:subject ).permit(:name)
  end
end
