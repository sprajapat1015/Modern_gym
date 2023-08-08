class TrainerCoachesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @trainer_coaches = TrainerCoach.all
  end
  
  def show
    @trainer_coach = TrainerCoach.find(params[:id ])
  end

  def new
    @trainer_coach = TrainerCoach.new
  end

  def create

    @trainer_coach = TrainerCoach.new(trainer_coach_params)

    if @trainer_coach.save
      @trainer_coach.add_role :coach, @trainer_coach 
      redirect_to  trainer_coaches_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @trainer_coach = TrainerCoach.find(params[:id])

    if @trainer_coach.update(trainer_coach_params)
      redirect_to @trainer_coach
    else 
      render :new, status: :unprocessable_entity
    end

  end
  def edit
    @trainer_coach = TrainerCoach.find(params[:id])

  end


  def destroy
    @trainer_coach =TrainerCoach.find(params[:id])
    @trainer_coach.destroy

    redirect_to root_path, status: :see_other

  end

  private

  def trainer_coach_params
    params.require(:trainer_coach).permit(:first_name, :last_name, :phone_number,:expertise )
  end

end
