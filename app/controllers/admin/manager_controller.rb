class Admin::ManagerController < ApplicationController
	def index
    @managers=User.manager
  end
  
  def new
    @manager=User.new
  end

  def create
  	@manager=User.new(manager_params.merge(role: 1))
  	if @manager.save
  		redirect_to admin_manager_index_path
  	else
  		render :new
  	end
  end

  def show_all
  	
  end
  
  def destroy
  	@manager=User.find(params[:id])
  	@manager.destroy
  	redirect_to admin_manager_index_path
  end
  private
  def manager_params
  	params.require(:user).permit(:name, :email, :mob_no, :role,:password, :password_confirmation, :avatar)
  end
end
