class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! 

  # before_action :access_check
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_home_path
    elsif resource.manager?
      managers_home_index_path
    else
      user_home_path
    end
  end

  def after_sign_up_path_for(resource)
    user_home_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:mob_no])
  end



  # def access_check
  #   if params[:controller].include?("admin")
  #     if !current_user.admin?
  #       redirect_to admin_home_index_path
  #     end
  #   elsif params[:controller].include?("managers")
  #     if !current_user.manager?
  #       redirect_to managers_home_index_path
  #     end
  #   elsif params[:controller].include?("user")
  #     if !current_user.customer?
  #       redirect_to user_home_path
  #     end
  #   end
  # end
  
end
