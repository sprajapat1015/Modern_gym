class PaymentsController < ApplicationController
  before_action :set_user,only: [:new, :create]
  # before_action  :authenticate_user!

  def index
    # byebug
    @user = User.find(params[:user_id])
    @payment = @user.payments
    # render json: @payment
  end
 

  def new
    @user = User.find_by(params[:user_id])
    @payment = @user.payments.new
  end

  def create
    @payment = @user.payments.new(payment_params)
    if @payment.save
      # redirect_to @user
      redirect_to root_path, notice: 'Payment was successfully Done.'
    else 
      render :new, status: :unprocessable_entity
    end
  end



  private 
  def set_user
    @user = User.find(params[:user_id])
  end

  def payment_params
    params.require(:payment).permit(:amount, :payment_date, :user_id, :membership_id)
  end
end