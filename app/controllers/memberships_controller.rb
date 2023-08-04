
class MembershipsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @membership = Membership.new
  end

  def create
    # debugger
    @membership = @user.memberships.new(membership_params.merge(user_id: params[:user_id]))
     if @membership.save
      # redirect_to root_path, notice: 'Membership was successfully created.'
      redirect_to new_user_payment_path, notice: 'Membership was successfully created.'
     else
      redirect_to @user, notice: 'Membership not created'
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
