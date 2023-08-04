# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params

  # def create
  #   super
  #   UserMailer.with(user: @current_user).welcome_email.deliver_now
  # end
  
  def create
    super
    UserJobsJob.perform_now(@user)
  end


  protected
  def configure_sign_up_params
    # byebug
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name, :email, :password, :date_of_birth, :phone_number, :gender, address_attributes: [:house_no,:street,:city,:state,:postal_code]])
  end

end
