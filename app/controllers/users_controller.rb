class UsersController < ApplicationController

  before_action :authenticate_user!
  
  # def index
  #   @users = User.all
  # end
  
  def show
    @user = User.find(params[:id ])
  end

  # def new
  #   @user = User.new
  # end

  # def create

  #   @user = User.new(user_params)

  #   if @user.save

  #     redirect_to @user
  #   else 
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   @user = User.find(params[:id])

  #   if @user.update(user_params)
  #     redirect_to @user
  #   else 
  #     render :new, status: :unprocessable_entity
  #   end

  # end
  # def edit
  #   @user = User.find(params[:id])

  # end


  # def destroy
  #   @user =User.find(params[:id])
  #   @user.destroy

  #   redirect_to root_path, status: :see_other

  # end

  private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :password, :date_of_birth, :phone_number, :gender, address: [:house_no,:street,:city,:state,:postal_code])
  # end

  

end
