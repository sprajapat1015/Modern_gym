class EnrollmentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @enrollment = @user.enrollments
    # render json: @enrollment
  end
  
  # def show
  #   @enrollment = Enrollment.find(params[:id ])
  # end

  def new
    @user = User.find(params[:user_id])
    @enrollment = @user.enrollments.new
  end

  def create
    @user = User.find(params[:user_id])
    @enrollment = @user.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to @user
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def update
    @enrollment = Enrollment.find(params[:id])

    if @enrollment.update(enrollment_params)
      redirect_to @enrollment
    else 
      render :new, status: :unprocessable_entity
    end

  end

  # def destroy
  #   @enrollment =Enrollment.find(params[:id])
  #   @enrollment.destroy
  #   redirect_to root_path, status: :see_other
  # end


  private
  def enrollment_params
    params.require(:enrollment).permit(:enrollment_date,:course_id, :user_id)
  end


end
