class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def show
    @course = Course.find(params[:id ])
  end

  def new
    # byebug
    @trainer_coach = TrainerCoach.find(params[:trainer_coach_id])
    @course = @trainer_coach.courses.new

    # @course = Course.new
  end

  def create
    @trainer_coach= TrainerCoach.find(params[:trainer_coach_id])
    @course = @trainer_coach.courses.new(course_params)
    # byebug
     if @course.save
       redirect_to @trainer_coach
     else 
       render :new, status: :unprocessable_entity
     end
  end

  def edit
    @course = Course.find(params[:id])

  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course
    else 
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @course =Course.find(params[:id])
    @course.destroy

    redirect_to root_path, status: :see_other

  end


  private
  def course_params
    params.require(:course).permit( :description, :start_time, :end_time, :capacity,:class_name, :trainer_coach_id )
  end
end

