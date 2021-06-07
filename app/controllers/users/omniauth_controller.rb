class Users::OmniauthController < ApplicationController
  skip_before_action :authenticate_user! 
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth']) 
    @user.save(validate: false)
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end 
  end

  # facebook callback
  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    @user.save(validate: false)
    if @user.persisted?
      sign_in_and_redirect @user
    else
      redirect_to new_user_registration_url
    end 
  end

  def twitter
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    @user.save(validate: false)
    if @user.persisted?
      sign_in_and_redirect @user
    else
      redirect_to new_user_registration_url
    end 
  end

  def linkedin
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    @user.save(validate: false)
    if @user.persisted?
      sign_in_and_redirect @user
    else
      redirect_to new_user_registration_url
    end 
  end

  def failure
    redirect_to new_user_registration_url
  end
end
