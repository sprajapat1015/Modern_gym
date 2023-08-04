class TrainersController < ApplicationController
  
  def index
    # @trainers = Trainer.all
  end
  
  def show
    @trainer = Trainer.find(params[:id ])
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_param)

    if @trainer.save

      redirect_to @trainer
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @trainer = Trainer.find(params[:id])

  end

  def update
    @trainer = Trainer.find(params[:id])

    if @trainer.update(trainer_param)
      redirect_to @trainer
    else 
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @trainer =Trainer.find(params[:id])
    @trainer.destroy

    redirect_to root_path, status: :see_other

  end


  private
  def trainer_param
    params.require(:trainer).permit(:first_name, :last_name, :phone_number, 
      :email,:password,:email_confirmation, :expertise)
  end
end
