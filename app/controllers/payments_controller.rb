class PaymentsController < ApplicationController
  before_action :set_user,only: [:new, :create]
  # before_action  :authenticate_user!

  def index
    @payments = Payment.all
  end
  
  def show
    @payment = Payment.find(params[:id ])
  end

  def new
    @user = User.find_by(params[:user_id])
    @payment = @user.payments.new
  end

  def create
    @payment = @user.payments.new(payment_params)

    if @payment.save
      redirect_to root_path, notice: 'Payment was successfully Done.'
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @payment = Payment.find(params[:id])

  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update(payment_params)
      redirect_to @payment
    else 
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @payment =Payment.find(params[:id])
    @payment.destroy

    redirect_to root_path, status: :see_other

  end


  private 
  def set_user
    @user = User.find(params[:user_id])
  end

  def payment_params
    params.require(:payment).permit(:amount, :payment_date, :user_id, :membership_id)
  end
end