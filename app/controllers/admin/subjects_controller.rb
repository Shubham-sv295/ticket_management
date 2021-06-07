class Admin::SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :destroy, :update]
  def index
    @subjects=Subject.all
  end

  def new
    @subject=Subject.new
  end

  def remove_manager
    manager = User.find_by(id: params[:id])
    @subject = Subject.find_by(id: params[:subject])
    if manager.present?
      @subject.managers.delete(manager)
    end
    redirect_to admin_subject_path(@subject.id)
  end  

  def create
    @subject=Subject.new(subject_params)
    if @subject.save
      if params[:subject][:manager].present?
        params[:subject][:manager].each do |manager_id|
          manager = User.find_by(id: manager_id)
          if manager && @subject.managers.exclude?(manager)
            @subject.managers << manager
            message = "Hi Mr. #{manager.name} \n We have assign you a new responsibility \n #{@subject.name} \n From now you will have to handle This type of issue \n Thanks regards \n Ticket Management"
            TwilioTextMessenger.new(message, manager.mob_no).call
            UserMailer.with(manager: manager,subject: @subject).assign_subject_to_manager.deliver
          end  
        end
      end
      redirect_to admin_subjects_path
    else
      render :add_new_subject
    end
  end

  def destroy
    @subject.destroy
    redirect_to admin_subjects_path
  end

  def edit; end

  def update
    if @subject.update(subject_params)
      if params[:subject][:manager].present?
        params[:subject][:manager].each do |manager_id|
          manager = User.find_by(id: manager_id)
          if manager && @subject.managers.exclude?(manager)
            @subject.managers << manager
            message = "Hi Mr. #{manager.name} \n We have assign you a new responsibility \n #{@subject.name} \n From now you will have to handle This type of issue \n Thanks regards \n Ticket Management"
            TwilioTextMessenger.new(message, manager.mob_no).call
            UserMailer.with(manager: manager,subject: @subject).assign_subject_to_manager.deliver
          end  
        end
      end
    redirect_to admin_subject_path(@subject.id)
    else
      render :edit
    end
  end

  def show
    @subject = Subject.find_by(id: params[:id])
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :managers, manager: [])
  end

  def set_subject
    @subject = Subject.find_by(id: params[:id])
    return redirect_to root_path if @subject.blank? 
  end

end
