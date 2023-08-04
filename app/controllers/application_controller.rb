class ApplicationController < ActionController::Base


  # before_action :configure_permitted_parameters, if: :devise_controller?
  

  # protected

  #      def configure_permitted_parameters
  #           devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :date_of_birth, :phone_number, :gender,
  #             address_attributes: [:house_no,:street,:city,:state,:postal_code]
  #             )}

  #           # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  #      end
end


