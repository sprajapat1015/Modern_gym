
class MembershipsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  def index
    @user = User.find(params[:user_id])
    @membership = @user.memberships
  end

  def new
    @user = User.find(params[:user_id])
    @membership = @user.memberships.new
  end

  def create
    # debugger
    @membership = @user.memberships.new(membership_params.merge(user_id: params[:user_id]))
     if @membership.save
      # redirect_to root_path, notice: 'Membership was successfully created.'
      redirect_to new_user_payment_path
     else
      # redirect_to @user, notice: 'Membership not created'
      render :new, status: :unprocessable_entity
     end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def membership_params
    params.require(:membership).permit(:start_date, :end_date, :status, :class_name)
  end
end
